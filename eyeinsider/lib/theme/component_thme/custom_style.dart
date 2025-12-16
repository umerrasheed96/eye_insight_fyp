import 'package:eyeinsider/constants/color_constant.dart';
import 'package:flutter/material.dart';


class CustomStyle {
  static final iconButtonStyleWithoutBackground = IconButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(1000),
    ),
  );

  static final iconButtonWithOpaqueBackground = IconButton.styleFrom(
    backgroundColor: ColorConstant.black.withOpacity(0.6),
    foregroundColor: ColorConstant.black.withOpacity(0.6),
    disabledBackgroundColor: ColorConstant.darkGrey.withOpacity(0.6),
    disabledForegroundColor: ColorConstant.darkGrey.withOpacity(0.6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1000),
    ),
  );
}