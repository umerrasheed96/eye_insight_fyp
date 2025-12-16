import 'package:flutter/material.dart';
/**
class CustomTextStyle extends TextTheme {
  static String family = 'Open Sans';
  final Color fontColor = Colors.black;

  @override
  TextStyle? get bodyLarge => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w400,
        color: fontColor,
      );

  @override
  TextStyle? get bodyMedium => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w400,
        color: fontColor,
      );

  @override
  TextStyle? get bodySmall => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w400,
        color: fontColor,
      );

  @override
  TextStyle? get displayLarge => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w400,
        color: fontColor,
      );

  @override
  TextStyle? get displayMedium => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w400,
        color: fontColor,
      );

  @override
  TextStyle? get displaySmall => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w400,
        color: fontColor,
      );

  @override
  TextStyle? get headlineLarge => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w400,
        color: fontColor,
      );

  @override
  TextStyle? get headlineMedium => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w400,
        color: fontColor,
      );

  @override
  TextStyle? get headlineSmall => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w400,
        color: fontColor,
      );

  @override
  TextStyle? get labelLarge => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w600,
        color: fontColor,
      );

  @override
  TextStyle? get labelMedium => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w500,
        color: fontColor,
      );

  @override
  TextStyle? get labelSmall => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w500,
        color: fontColor,
      );

  @override
  TextStyle? get titleLarge => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w500,
        color: fontColor,
      );

  @override
  TextStyle? get titleMedium => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w500,
        color: fontColor,
      );

  @override
  TextStyle? get titleSmall => TextStyle(
        fontFamily: family,
        fontWeight: FontWeight.w500,
        color: fontColor,
      );
}

 */
///
///
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/utils.dart';

extension BuildContextUtils on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  String get fontFamily => Utils.kNunitoFontFamily;

  // label
  TextStyle? get labelSmall => textTheme.labelSmall?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 11.sp,
      );

  TextStyle? get labelMedium => textTheme.labelMedium?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
      );

  TextStyle? get labelLarge => textTheme.labelLarge?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
      );

  // body
  TextStyle? get bodySmall => textTheme.bodySmall?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
      );

  TextStyle? get bodyMedium => textTheme.bodyMedium?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      );

  TextStyle? get bodyLarge => textTheme.bodyLarge?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      );

  // title
  TextStyle? get titleSmall => textTheme.titleSmall?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
      );

  TextStyle? get titleMedium => textTheme.titleMedium?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      );

  TextStyle? get titleLarge => textTheme.titleLarge?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 22.sp,
      );

  // headline
  TextStyle? get headlineSmall => textTheme.headlineSmall?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 24.sp,
      );

  TextStyle? get headlineMedium => textTheme.headlineMedium?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 28.sp,
      );

  TextStyle? get headlineLarge => textTheme.headlineLarge?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 32.sp,
      );

  // display
  TextStyle? get displaySmall => textTheme.displaySmall?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 36.sp,
      );

  TextStyle? get displayMedium => textTheme.displayMedium?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 45.sp,
      );

  TextStyle? get displayLarge => textTheme.displayLarge?.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 57.sp,
      );
}