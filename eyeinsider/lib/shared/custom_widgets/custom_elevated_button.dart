import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/constants/utils.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? bgColor;
  final bool loading;
  final String title;
  final void Function() onPressed;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.bgColor,
    this.loading = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(44),
          backgroundColor: bgColor ?? ColorConstant.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          textStyle: const TextStyle(
            fontFamily: Utils.kInterFontFamily,
            color: ColorConstant.secondary,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          )),
      onPressed: onPressed,
      child: 
      loading == true?
      const CircularProgressIndicator.adaptive(
        strokeCap: StrokeCap.round,
        backgroundColor: Colors.white,
      )
       : 
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        
          Text(
            title,
            style: context.titleMedium?.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
