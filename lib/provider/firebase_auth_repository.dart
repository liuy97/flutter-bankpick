import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this._auth);
  final FirebaseAuth _auth;

  Stream<User?> authStateChanges() => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  Future<void> signInAnonymously() {
    return _auth.signInAnonymously();
  }

  Future<void> logout() {
    return _auth.signOut();
  }
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.watch(firebaseAuthProvider));
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
}

class AuthStateNotifier extends ChangeNotifier {
  final FirebaseAuth _auth;
  bool _signedIn = false;

  bool get signedIn => _signedIn;

  AuthStateNotifier(this._auth) {
    _auth.authStateChanges().listen((user) {
      _signedIn = user != null;
      notifyListeners();
    });
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _signedIn = false;
    notifyListeners();
  }

  Future<bool> signIn() async {
    await _auth.signInAnonymously();

    _signedIn = true;
    notifyListeners();
    return _signedIn;
  }

  @override
  bool operator ==(Object other) =>
      other is AuthStateNotifier && other._signedIn == _signedIn;

  @override
  int get hashCode => _signedIn.hashCode;
}

final authStateNotifierProvider =
    ChangeNotifierProvider<AuthStateNotifier>((ref) {
  return AuthStateNotifier(ref.read(firebaseAuthProvider));
});
