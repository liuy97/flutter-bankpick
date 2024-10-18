import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// The themes for this app are defined here.
class AppTheme {
  // This constructor prevents external instantiation and extension.
  AppTheme._();

  static ThemeData light({
    required bool useMaterial3,
    required int usedTheme,
    required bool swapColors,
    required FlexSurfaceMode surfaceMode,
    required int blendLevel,
    //
    required bool usePrimaryKeyColor,
    required bool useSecondaryKeyColor,
    required bool useTertiaryKeyColor,
    required int usedFlexTone,
    //
    required double drawerWidth,
    //
    required double appBarElevation,
    required FlexAppBarStyle? appBarStyle,
    required double appBarOpacity,
    required bool transparentStatusBar,
    //
    required bool useSubTheme,
    required double? defaultRadius,
    //
    required TargetPlatform platform,
  }) {
    // In case we need to use the ColorScheme defined by defined FlexColorScheme
    // as input to a custom sub-theme, we can make the FCS object and get the
    // ColorS
    final FlexColorScheme flexScheme = FlexColorScheme.light(
      useMaterial3: useMaterial3,
      colors: flexSchemeLight,
      swapColors: swapColors,
      surfaceMode: surfaceMode,
      blendLevel: blendLevel,
      //
      keyColors: FlexKeyColors(
        useKeyColors: usePrimaryKeyColor,
        useSecondary: useSecondaryKeyColor,
        useTertiary: useTertiaryKeyColor,
      ),
      // tones: FlexTone.values[usedFlexTone].tones(Brightness.light),
      //
      appBarElevation: appBarElevation,
      appBarStyle: appBarStyle,
      appBarOpacity: appBarOpacity,
      transparentStatusBar: transparentStatusBar,
      //
      subThemesData: useSubTheme
          ? FlexSubThemesData(
              defaultRadius: defaultRadius,
              thinBorderWidth: 1,
              thickBorderWidth: 2,
              drawerWidth: drawerWidth,
            )
          : null,
      //
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      // fontFamily: AppFonts.mainFont,
      typography: Typography.material2021(platform: platform),
      platform: platform,
    );

    return flexScheme.toTheme;
  }

  static ThemeData dark({
    required bool useMaterial3,
    required int usedTheme,
    required bool swapColors,
    required FlexSurfaceMode surfaceMode,
    required int blendLevel,
    required bool usePrimaryKeyColor,
    required bool useSecondaryKeyColor,
    required bool useTertiaryKeyColor,
    required int usedFlexTone,
    //
    required double drawerWidth,
    //
    required double appBarElevation,
    required FlexAppBarStyle? appBarStyle,
    required double appBarOpacity,
    required bool transparentStatusBar,
    required bool computeDark,
    required int darkLevel,
    required bool darkIsTrueBlack,
    required bool useSubTheme,
    required double? defaultRadius,
    required TargetPlatform platform,
  }) {
    return FlexThemeData.dark(
      useMaterial3: useMaterial3,
      colors: computeDark
          ? flexSchemeLight.defaultError.toDark(darkLevel, useMaterial3)
          : flexSchemeDark,
      swapColors: swapColors,
      surfaceMode: surfaceMode,
      blendLevel: blendLevel,
      //
      keyColors: FlexKeyColors(
        useKeyColors: usePrimaryKeyColor,
        useSecondary: useSecondaryKeyColor,
        useTertiary: useTertiaryKeyColor,
      ),
      // textTheme: TextTheme(
      //     bodyLarge: TextStyle(fontSize: 16, color: Color()),
      //     bodyMedium: TextStyle(fontSize: 14, color: Color()),
      //     bodySmall: TextStyle(fontSize: 12, color: Color())),
      // tones: FlexTone.values[usedFlexTone].tones(Brightness.dark),
      //
      appBarElevation: appBarElevation,
      appBarStyle: appBarStyle,
      appBarOpacity: appBarOpacity,
      transparentStatusBar: transparentStatusBar,
      //
      darkIsTrueBlack: darkIsTrueBlack,
      //
      subThemesData: useSubTheme
          ? FlexSubThemesData(
              defaultRadius: defaultRadius,
              thinBorderWidth: 1,
              thickBorderWidth: 2,
              drawerWidth: drawerWidth,
            )
          : null,
      //
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      // fontFamily: AppFonts.mainFont,
      typography: Typography.material2021(platform: platform),
      platform: platform,
    );
  }

  static const FlexSchemeColor flexSchemeLight = FlexSchemeColor(
    primary: Color(0xff0066ff),
    primaryContainer: Color(0xffd0e4ff),
    secondary: Color(0xff525f70),
    secondaryContainer: Color(0xffd6e4f7),
    tertiary: Color(0xff6a5779),
    tertiaryContainer: Color(0xfff1daff),
    error: Color(0xffba1a1a),
    errorContainer: Color(0xffffdad6),
  );

  static const FlexSchemeColor flexSchemeDark = FlexSchemeColor(
    primary: Color(0xff0066ff),
    primaryContainer: Color(0xff00497a),
    secondary: Color(0xffbac8db),
    secondaryContainer: Color(0xff3b4857),
    tertiary: Color(0xffd5bee5),
    tertiaryContainer: Color(0xff514060),
    error: Color(0xffffb4ab),
    errorContainer: Color(0xff93000a),
  );
}
