
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/service/extensions/widgets_extension.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_text_field.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';
import 'package:flutter/material.dart';

class LabelAndTextField extends StatelessWidget {
  
  final String label;
  final CustomTextField customTextField;
  const LabelAndTextField({
    super.key,required this.label, required this.customTextField,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
    
                Text(label , textAlign: TextAlign.center, style: context.bodyMedium?.copyWith( fontWeight: FontWeight.w800, color: ColorConstant.lightGrey),),
            10.height,
          customTextField 
     ],
    );
  }
}
