import 'package:eyeinsider/constants/assets_path/image_constant.dart';
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';
import 'package:eyeinsider/views/splash_and_onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorConstant.informative,
        systemNavigationBarColor: ColorConstant.informative,
      ),
    );
    Future.delayed(const Duration(seconds: 2)).then((v) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.informative,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                height: .5.sh,
                width: .8.sw,
                child: Center(
                    child: Image.asset(
                  ImageConstant.appLogo,
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Text(
                'Eye Disease Detector Tool',
                style: context.titleLarge?.copyWith(
                    color: ColorConstant.secondary,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ));
  }
}
