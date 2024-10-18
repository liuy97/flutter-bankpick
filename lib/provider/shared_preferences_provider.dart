import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/key_value_db_prefs.dart';

final Provider<KeyValueDbPrefs> sharedPreferencesProvider =
    Provider<KeyValueDbPrefs>((ProviderRef<KeyValueDbPrefs> ref) {
  return KeyValueDbPrefs();
});
