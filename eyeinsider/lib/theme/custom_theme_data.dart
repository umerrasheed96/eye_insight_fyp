import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/constants/utils.dart';
import 'package:eyeinsider/theme/component_thme/component_theme.dart';
import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData getThemeData({bool isDark = false}) {
    final colorScheme = isDark ? darkColorScheme() : lightColorScheme();
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      // textTheme: CustomTextStyle(),
      appBarTheme: ComponentTheme.appBarTheme,
      textButtonTheme: ComponentTheme.textButtonTheme,
      iconButtonTheme: ComponentTheme.iconButtonTheme,
      filledButtonTheme: ComponentTheme.fillButtonThemeData,
      outlinedButtonTheme: ComponentTheme.outlinedButtonTheme,
      elevatedButtonTheme: ComponentTheme.elevatedButtonTheme,
      inputDecorationTheme: ComponentTheme.inputDecorationTheme,
      progressIndicatorTheme: ComponentTheme.progressIndicatorTheme,
      bottomSheetTheme: ComponentTheme.bottomsheetTheme,
      checkboxTheme: ComponentTheme.checkboxThemeData,
      cardTheme: ComponentTheme.cardTheme,
      radioTheme: ComponentTheme.radioThemeData,
      fontFamily:  Utils.kUrbanistFontFamily,
      dividerColor: ColorConstant.divider,
      hintColor: ColorConstant.hintColor,
      splashColor: Colors.transparent,
      disabledColor: ColorConstant.disabledColor,
      scaffoldBackgroundColor: ColorConstant.scaffoldBackgroundColor,
      dialogBackgroundColor: ColorConstant.dialogBackgroundColor,
    );
  }

  static lightColorScheme() => const ColorScheme.light(
        primary: ColorConstant.primary,
        secondary: ColorConstant.secondary,
        tertiary: ColorConstant.tertiary,
        error: ColorConstant.error,
        surface: Colors.transparent,
        surfaceTint: Colors.transparent,
      );
  static darkColorScheme() => const ColorScheme.dark();
}