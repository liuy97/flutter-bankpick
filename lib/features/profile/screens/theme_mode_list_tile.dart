import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/local_settings.dart';
import 'theme_mode_toggle_buttons.dart';

class ThemeModeListTile extends ConsumerWidget {
  const ThemeModeListTile({this.title, super.key});

  final Widget? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode mode = ref.watch(LocalSettings.themeModeProvider);
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: title,
      subtitle: Text(mode.name),
      onTap: () {
        switch (ref.read(LocalSettings.themeModeProvider)) {
          case ThemeMode.light:
            ref
                .read(LocalSettings.themeModeProvider.notifier)
                .set(ThemeMode.system);
            break;
          case ThemeMode.system:
            ref
                .read(LocalSettings.themeModeProvider.notifier)
                .set(ThemeMode.dark);
            break;
          case ThemeMode.dark:
            ref
                .read(LocalSettings.themeModeProvider.notifier)
                .set(ThemeMode.light);
            break;
        }
      },
      trailing: const ThemeModeToggleButtons(),
    );
  }
}
