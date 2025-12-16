
import 'package:eyeinsider/constants/utils.dart';
import 'package:eyeinsider/service/extensions/widgets_extension.dart';
import 'package:eyeinsider/shared/custom_widgets/input_descriptor.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';

class CustomTextField extends StatelessWidget {
  final InputDescriptor descriptor;
  final bool readOnly;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? filledColor;
  final InputBorder? inputBorder;
  final TextInputType? keyBoardType;
  
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final FocusNode? nextFocusNode;
   final int? maxLines;
   
  final Function()? onTap;


  const CustomTextField({
    super.key, required this.descriptor, this.readOnly = false, this.prefixIcon, this.suffixIcon, this.filledColor, this.inputBorder, this.keyBoardType, this.onChange, this.validator, this.textInputAction = TextInputAction.next,this.nextFocusNode, this.maxLines, this.onTap, this.obscureText =  false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            onTap: onTap,
      maxLines: maxLines ?? 1,
      controller: descriptor.controller,
    focusNode: descriptor.focusNode,
      obscureText: obscureText,
      keyboardType: keyBoardType,
      readOnly: readOnly,
      
      onChanged: onChange,
      validator: validator,
       onFieldSubmitted: (_) {
        if (nextFocusNode != null) {
          nextFocusNode!.requestFocus(); // Move focus to the next field
        } else {
          descriptor.focusNode.unfocus(); // If no next field, unfocus
        }
      },
      style: context.bodyMedium?.copyWith(color: ColorConstant.lightGrey),
      decoration:  InputDecoration(
        hintText: descriptor.hintText,
        hintStyle: context.bodyMedium?.copyWith(color: ColorConstant.lightGrey),
          filled: true,
          fillColor: ColorConstant.textFieldfill,
          border: kTextFieldBorder,
          enabledBorder: kTextFieldBorder,
        disabledBorder: kTextFieldBorder,
        errorBorder: kTextFieldBorder,
        focusedBorder: kTextFieldBorder,
        suffixIconConstraints: const BoxConstraints(),
          prefixIconConstraints: const BoxConstraints(),
           prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
                label: descriptor.label != null
              ? Text(
                  descriptor.label!,
                  style: context.labelMedium?.copyWith(
                      color: ColorConstant.lightGrey,
                      fontWeight: FontWeight.w300,
                      fontSize: 16),
                )
              : null

    
      ),  
    ).bottomPadding;
  }
}