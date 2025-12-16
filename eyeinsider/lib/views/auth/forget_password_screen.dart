import 'package:eyeinsider/constants/assets_path/image_constant.dart';
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/providers/auth_provider.dart';
import 'package:eyeinsider/service/extensions/widgets_extension.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_elevated_button.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_text_field.dart';
import 'package:eyeinsider/shared/custom_widgets/input_descriptor.dart';
import 'package:eyeinsider/shared/custom_widgets/label_and_text_field.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  static const id = 'forgetPasswordScreen';
  static dynamic route =
      MaterialPageRoute(builder: (context) => const ForgetPassword());
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late InputDescriptor emailDescriptor;
  late InputDescriptor passwordDescriptor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    emailDescriptor = InputDescriptor(hintText: 'Enter your email address...');
    passwordDescriptor = InputDescriptor(hintText: 'Enter your password...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(
              height: .3.sh,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    ImageConstant.authBg,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      bottom: 50,
                      left: 20,
                      right: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Forgot Password',
                            style: context.headlineLarge
                                ?.copyWith(color: ColorConstant.primary),
                          ),
                          10.height,
                          Text(
                            'Enter your Email then we will send you OTP  to reset new password.',
                            textAlign: TextAlign.center,
                            style: context.bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  .1.sh.height,
                  LabelAndTextField(
                      label: 'Email',
                      customTextField:
                          CustomTextField(descriptor: emailDescriptor)),
                  // Spacer(),

                  Consumer<AuthProvider2>(builder: (context, prov, _) {
                    return CustomElevatedButton(
                      title: 'Send OTP',
                      loading: prov.loading,
                      onPressed: () {
                        prov.resetPassword(
                            email: emailDescriptor.controller.text.trim());
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
