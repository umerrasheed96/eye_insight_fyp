import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// returning SizedBox with coming dimension
extension IntToSizedBox on num {
  Widget get height => SizedBox(height: toDouble().h);

  Widget get width => SizedBox(width: toDouble().w);
}


extension BottomPadding on Widget{
  Widget get bottomPadding => Padding(padding: const EdgeInsets.only(bottom: 14) , child: this,);


}

