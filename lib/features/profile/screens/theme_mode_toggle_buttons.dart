import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/local_settings.dart';

/// Toggle the surface style of the application.
///
/// This toggle bakes in the Riverpod state provider and is tied to this app
/// implementation. This approach is easy to use since there is nothing to
/// pass around to set its value, just drop in the Widget anywhere in the app.
@immutable
class ThemeModeToggleButtons extends ConsumerWidget {
  const ThemeModeToggleButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(LocalSettings.themeModeProvider);
    final List<bool> isSelected = <bool>[
      themeMode == ThemeMode.light,
      themeMode == ThemeMode.system,
      themeMode == ThemeMode.dark,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        if (newIndex == 0) {
          ref
              .read(LocalSettings.themeModeProvider.notifier)
              .set(ThemeMode.light);
        } else if (newIndex == 1) {
          ref
              .read(LocalSettings.themeModeProvider.notifier)
              .set(ThemeMode.system);
        } else {
          ref
              .read(LocalSettings.themeModeProvider.notifier)
              .set(ThemeMode.dark);
        }
      },
      children: const <Widget>[
        Icon(Icons.wb_sunny),
        Icon(Icons.phone_iphone),
        Icon(Icons.bedtime),
      ],
    );
  }
}
