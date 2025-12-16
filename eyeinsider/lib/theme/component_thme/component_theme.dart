// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/constants/utils.dart';
import 'package:flutter/material.dart';
class ComponentTheme {
  //================ Appbar Theme Start =================
  static AppBarTheme appBarTheme = const AppBarTheme(
      backgroundColor: Color(0xff242429),
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 70);
  //================ Appbar Theme End =================
  //================ Indicator Theme Start =================
  static ProgressIndicatorThemeData progressIndicatorTheme =
      const ProgressIndicatorThemeData(
    color: ColorConstant.secondary,
    circularTrackColor: Color(0xffD9D9D9),
  );
//================ Indicator Theme end =================
//================ BottomSheet Theme Start =================
  static BottomSheetThemeData bottomsheetTheme = const BottomSheetThemeData(
    dragHandleColor: Color(0xff79747E),
    showDragHandle: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
  );
//================ BottomSheet Theme End =================

  static CheckboxThemeData checkboxThemeData = CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.black),
    side: const BorderSide(color: ColorConstant.disabledTextColor),
  );

  static RadioThemeData radioThemeData = RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
    if (states.contains(MaterialState.selected)) {
      return ColorConstant.primary;
    } else {
      return ColorConstant.darkGrey;
    }
  }));

  // ================== TextForm Decoration Start ===================
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: TextStyle(
      fontFamily:  Utils.kUrbanistFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: ColorConstant.hintColor,
    ),
    errorStyle: TextStyle(
        fontFamily: Utils.kUrbanistFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: ColorConstant.error),
    labelStyle: TextStyle(
      fontFamily: Utils.kUrbanistFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: ColorConstant.darkGrey,
    ),
    floatingLabelStyle: TextStyle(
      fontFamily: Utils.kUrbanistFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    isDense: true,
    filled: true,
    fillColor: Colors.transparent,
    border: OutlineInputBorder(
      borderSide:
          const BorderSide(width: 1, color: ColorConstant.disabledColor),
      borderRadius: BorderRadius.circular(4),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: ColorConstant.error),
      borderRadius: BorderRadius.circular(4),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Color(0xffD8D8D8)),
      borderRadius: BorderRadius.circular(4),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 3, color: ColorConstant.error),
      borderRadius: BorderRadius.circular(4),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 3, color: ColorConstant.primary),
      borderRadius: BorderRadius.circular(4),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(width: 1, color: ColorConstant.disabledColor),
      borderRadius: BorderRadius.circular(4),
    ),
  );
  // ================== TextForm Decoration End ===================

  static const CardTheme cardTheme = CardTheme(
    color: ColorConstant.whiteColor,
    elevation: 0,
  );

  //================ Button Theme Data Start =================
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(30),
      maximumSize: const Size.fromHeight(45),
      padding: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );

  static final fillButtonThemeData = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: ColorConstant.primary,
      minimumSize: const Size.fromHeight(40),
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size.fromHeight(40),
      padding: const EdgeInsets.symmetric(vertical: 18),
      foregroundColor: ColorConstant.primary,
      surfaceTintColor: ColorConstant.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      side: const BorderSide(
        color: Color(0xff303030),
        width: 1.5,
      ),
    ),
  );

  static final textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
        textStyle: TextStyle(
            fontSize: 16,
            decoration: TextDecoration.underline,
            decorationColor: ColorConstant.primary,
            fontWeight: FontWeight.w600,
            color: ColorConstant.primary,
            fontFamily: Utils.kUrbanistFontFamily,)),
  );

  static final iconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: ColorConstant.appBarColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xff5E5E5E)),
        borderRadius: BorderRadius.circular(1000),
      ),
    ),
  );

  //================ Button Theme Data End =================
}