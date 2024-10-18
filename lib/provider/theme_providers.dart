import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/app_theme.dart';
import 'local_settings.dart';
import 'platform_provider.dart';

/// The light [ThemeData] provider.
///
/// It is a simple [Provider], using our AppTheme.light function using
/// SettingsEntry based [StateNotifierProvider] properties that we watch for
/// changes.
///
/// We can use this [Provider] in our [MaterialApp] as a theme. Whenever any
/// of the watched [Settings] providers state is updated, the [MaterialApp]
/// will get new [ThemeData] and be rebuilt with the new theme applied.
final Provider<ThemeData> lightThemeProvider = Provider<ThemeData>(
  (ProviderRef<ThemeData> ref) {
    // Make an always valid FlexTones config getter from our unsafe int.
    final bool useSeed = ref.watch(LocalSettings.usePrimaryKeyColorProvider);

    return AppTheme.light(
      useMaterial3: ref.watch(LocalSettings.useMaterial3Provider),
      usedTheme: ref.watch(LocalSettings.schemeIndexProvider),
      swapColors: ref.watch(LocalSettings.lightSwapColorsProvider),
      surfaceMode: ref.watch(LocalSettings.lightSurfaceModeProvider),
      blendLevel: ref.watch(LocalSettings.lightBlendLevelProvider),
      //
      usePrimaryKeyColor: useSeed,
      useSecondaryKeyColor:
          ref.watch(LocalSettings.useSecondaryKeyColorProvider),
      useTertiaryKeyColor: ref.watch(LocalSettings.useTertiaryKeyColorProvider),
      usedFlexTone: 0,
      //
      drawerWidth: 100, // ref.watch(drawerWidthProvider),
      //
      appBarElevation: ref.watch(LocalSettings.appBarElevationProvider),
      appBarStyle: ref.watch(LocalSettings.lightAppBarStyleProvider),
      appBarOpacity: ref.watch(LocalSettings.lightAppBarOpacityProvider),
      transparentStatusBar:
          ref.watch(LocalSettings.transparentStatusBarProvider),
      //
      useSubTheme: ref.watch(LocalSettings.useSubThemesProvider),
      defaultRadius: ref.watch(LocalSettings.defaultRadiusProvider),
      //
      platform: ref.watch(platformProvider),
    );
  },
  name: 'lightThemeProvider',
);

/// The dark [ThemeData] provider.
///
/// Same setup as the [lightThemeProvider], we just have a few more properties.
final Provider<ThemeData> darkThemeProvider = Provider<ThemeData>(
  (ProviderRef<ThemeData> ref) {
    // Make an always valid FlexTones config getter from our unsafe int.
    final bool useSeed = ref.watch(LocalSettings.usePrimaryKeyColorProvider);

    return AppTheme.dark(
      useMaterial3: ref.watch(LocalSettings.useMaterial3Provider),
      usedTheme: ref.watch(LocalSettings.schemeIndexProvider),
      swapColors: ref.watch(LocalSettings.darkSwapColorsProvider),
      surfaceMode: ref.watch(LocalSettings.darkSurfaceModeProvider),
      blendLevel: ref.watch(LocalSettings.darkBlendLevelProvider),
      //
      usePrimaryKeyColor: useSeed,
      useSecondaryKeyColor:
          ref.watch(LocalSettings.useSecondaryKeyColorProvider),
      useTertiaryKeyColor: ref.watch(LocalSettings.useTertiaryKeyColorProvider),
      usedFlexTone: 0,
      //
      drawerWidth: 100, // ref.watch(drawerWidthProvider),
      //
      appBarElevation: ref.watch(LocalSettings.appBarElevationProvider),
      appBarStyle: ref.watch(LocalSettings.darkAppBarStyleProvider),
      appBarOpacity: ref.watch(LocalSettings.darkAppBarOpacityProvider),
      transparentStatusBar:
          ref.watch(LocalSettings.transparentStatusBarProvider),
      //
      darkIsTrueBlack: ref.watch(LocalSettings.darkIsTrueBlackProvider),
      computeDark: ref.watch(LocalSettings.darkComputeThemeProvider),
      darkLevel: ref.watch(LocalSettings.darkComputeLevelProvider),
      //
      useSubTheme: ref.watch(LocalSettings.useSubThemesProvider),
      defaultRadius: ref.watch(LocalSettings.defaultRadiusProvider),
      //
      platform: ref.watch(platformProvider),
    );
  },
  name: 'darkThemeProvider',
);
