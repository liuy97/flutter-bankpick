import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'firebase_options.dart';
import 'provider/local_settings.dart';
import 'provider/shared_preferences_provider.dart';
import 'provider/theme_providers.dart';
import 'services/router.dart';
import 'utils/provider_observer.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final ProviderContainer container = ProviderContainer(
    // This observer is used for logging changes in all Riverpod providers.
    observers: <ProviderObserver>[AppProviderObserver()],
  );

  // initialize shared preferences for use.
  await container.read(sharedPreferencesProvider).init();

  runApp(UncontrolledProviderScope(
    container: container,
    child: const _MainApp(),
  ));
}

class _MainApp extends ConsumerStatefulWidget {
  const _MainApp();

  @override
  ConsumerState<_MainApp> createState() => _ThemeDemoAppState();
}

class _ThemeDemoAppState extends ConsumerState<_MainApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Rebuild MaterialApp');
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: ref.watch(LocalSettings.languageProvider) == 'CN'
          ? const Locale('zh')
          : const Locale('en'),
      supportedLocales: const [
        Locale('en'), // English
        Locale('zh'), // Chinese
      ],
      debugShowCheckedModeBanner: false,
      title: 'Bankpick',
      theme: ref.watch(lightThemeProvider),
      darkTheme: ref.watch(darkThemeProvider),
      themeMode: ref.watch(LocalSettings.themeModeProvider),
      routerConfig: ref.watch(routerProvider),
    );
  }
}
