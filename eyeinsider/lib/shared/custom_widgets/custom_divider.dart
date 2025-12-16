
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  final bool showOrText;
  final double? bottomPadding , topPadding;
  const CustomDivider({
    super.key, this.showOrText = false,  this.bottomPadding, this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: bottomPadding ??  42.0.h , top:topPadding ??  42.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Divider(color: ColorConstant.divider , endIndent: 0,  indent:  0 , height: 0,),
        showOrText ?    CircleAvatar(radius: 20,  backgroundColor: ColorConstant.scaffoldBackgroundColor, child: Text('or' , style: context.bodyLarge?.copyWith(color: ColorConstant.lightGrey),),) :const SizedBox.shrink()
        ],
      ),
    );
  }
}