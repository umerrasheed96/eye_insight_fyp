import 'dart:developer';

import 'package:eyeinsider/providers/user_detail_provider.dart';
import 'package:eyeinsider/service/DI/di_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:eyeinsider/constants/assets_path/image_constant.dart';
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/data/user_data/user_model.dart';
import 'package:eyeinsider/providers/auth_provider.dart';
import 'package:eyeinsider/service/extensions/widgets_extension.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_divider.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_elevated_button.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_text_field.dart';
import 'package:eyeinsider/shared/custom_widgets/input_descriptor.dart';
import 'package:eyeinsider/shared/custom_widgets/label_and_text_field.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';
import 'package:eyeinsider/views/auth/login_screen.dart';
import 'package:eyeinsider/views/auth/user_detail_screen.dart/user_detail_screen.dart';
import 'package:eyeinsider/views/navigator_screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const id = 'signupScreen';
  static dynamic route = MaterialPageRoute(
      builder: (context) => const SignUpScreen(
            // userModel: null,
          ));

  // final UserModel? userModel;
  const SignUpScreen({
    super.key,
    // this.userModel,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                            'Sign Up',
                            style: context.headlineLarge
                                ?.copyWith(color: ColorConstant.primary),
                          ),
                          10.height,
                          Text(
                            'Let’s experience the joy of telehealth Medinest All In One App',
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
                  .04.sh.height,
                  LabelAndTextField(
                      label: 'Email',
                      customTextField:
                          CustomTextField(descriptor: emailDescriptor)),
                  LabelAndTextField(
                      label: 'Password',
                      customTextField:
                          CustomTextField(descriptor: passwordDescriptor)),
                  .04.sh.height,
                  Consumer<AuthProvider2>(builder: (context, prov, _) {
                    return CustomElevatedButton(
                      title: 'Sign up',
                      loading: prov.loading,
                      onPressed: () {
                        prov.signUpWithEmailPass(
                            email: emailDescriptor.controller.text.trim(),
                            password: passwordDescriptor.controller.text.trim(),
                            userModel: UserModel(name: "name", gender: "gender", age: 32, dob: DateTime.now(), previousEyeDisease: false, country: "Pk", city: "Karachi", phoneNumber: 213123, email: "sahmer003@gmail"));
                      },
                    );
                  }),
                  CustomDivider(
                    showOrText: true,
                    bottomPadding: .03.sh,
                    topPadding: .03.sh,
                  ),
                  CustomElevatedButton(
                    bgColor: Colors.blue.shade800,
                    title: 'Continue with google',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 25.h),
              child: Column(
                children: [
                  Center(
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Already have an account? ",
                            style: context.bodyLarge
                                ?.copyWith(color: ColorConstant.lightGrey),
                            children: [
                              TextSpan(
                                text: 'Sign in',
                                style: context.bodyLarge?.copyWith(
                                  color: ColorConstant.lightGrey,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(context, LoginScreen.route);
                                  },
                              )
                            ])),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
