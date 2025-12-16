import 'package:eyeinsider/constants/assets_path/image_constant.dart';
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/providers/auth_provider.dart';
import 'package:eyeinsider/service/extensions/widgets_extension.dart';
import 'package:eyeinsider/service/validator/validator_service.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_divider.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_elevated_button.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_text_field.dart';
import 'package:eyeinsider/shared/custom_widgets/input_descriptor.dart';
import 'package:eyeinsider/shared/custom_widgets/label_and_text_field.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';
import 'package:eyeinsider/views/auth/forget_password_screen.dart';
import 'package:eyeinsider/views/auth/signup_screen.dart';
import 'package:eyeinsider/views/navigator_screens/home_screen.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'loginScreen';
  static dynamic route =
      MaterialPageRoute(builder: (context) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                            'Sign In',
                            style: context.headlineLarge
                                ?.copyWith(color: ColorConstant.primary),
                          ),
                          10.height,
                          Text(
                            'Log in to access your personalized Medinest experience',
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
                      customTextField: CustomTextField(
                        descriptor: emailDescriptor,
                        validator: Validators.emailValidation,
                      )),
                  LabelAndTextField(
                      label: 'Password',
                      customTextField: CustomTextField(
                        descriptor: passwordDescriptor,
                        obscureText: true,
                        validator: Validators.passwordValidation,
                      )),
                  .04.sh.height,
                  Consumer<AuthProvider2>(builder: (context, prov, _) {
                    return CustomElevatedButton(
                      title: 'Sign in',
                      loading: prov.loading,
                      onPressed: () {
                        prov.loginWithEmailPass(
                            email: emailDescriptor.controller.text.trim(),
                            password:
                                passwordDescriptor.controller.text.trim());
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
                            text: "Don't have an account? ",
                            style: context.bodyLarge
                                ?.copyWith(color: ColorConstant.lightGrey),
                            children: [
                              TextSpan(
                                text: 'Sign up',
                                style: context.bodyLarge?.copyWith(
                                  color: ColorConstant.lightGrey,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(context, SignUpScreen.route);
                                  },
                              )
                            ])),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, ForgetPassword.route);
                    },
                    child: Text(
                      'Forgot your password?',
                      style: context.bodyLarge
                          ?.copyWith(color: ColorConstant.primary),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
