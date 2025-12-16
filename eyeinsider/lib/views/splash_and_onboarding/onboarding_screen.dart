import 'package:eyeinsider/constants/assets_path/image_constant.dart';
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';
import 'package:eyeinsider/views/auth/user_detail_screen.dart/user_detail_screen.dart';
import 'package:eyeinsider/views/splash_and_onboarding/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorConstant.whiteColor,
        systemNavigationBarColor: ColorConstant.whiteColor,
      ),
    );
  }

  final kDarkBlueColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      centerBackground: true,
      finishButtonText: 'Register',
      
      onFinish: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UserDetailScreen()));
      },
      finishButtonStyle: const FinishButtonStyle(
          backgroundColor: ColorConstant.primary, elevation: 10),
      skipTextButton: Text('Skip',
          style: context.titleMedium?.copyWith(
              color: ColorConstant.primary, fontWeight: FontWeight.w800)),
      trailing: Text('Start',
          style: context.titleMedium?.copyWith(
              color: ColorConstant.primary, fontWeight: FontWeight.w800)),
      trailingFunction: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const SplashScreen(),
          ),
        );
      },
      controllerColor: ColorConstant.primary,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Padding(
          padding: const EdgeInsets.only(top:  12.0),
          child: Image.asset(
            ImageConstant.onboarding1,
            fit: BoxFit.cover,
            height: .5.sh,
          ),
        ),
        Padding(
         padding: const EdgeInsets.only(top:  12.0),
          child: Image.asset(
            ImageConstant.onboarding2,
            fit: BoxFit.cover,
            height: .5.sh,
          ),
        ),
        Padding(
         padding: const EdgeInsets.only(top:  12.0),
          child: Image.asset(
            ImageConstant.onboarding3,
            fit: BoxFit.cover,
            height: .5.sh,
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text('Protect Your Vision',
                  textAlign: TextAlign.center,
                  style: context.headlineMedium
                      ?.copyWith(color: ColorConstant.primary)),
              const SizedBox(
                height: 20,
              ),
              Text('Detect issues early to protect your vision for life',
                  textAlign: TextAlign.center,
                  style: context.titleMedium
                      ?.copyWith(color: ColorConstant.lightGrey)),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text('Quick and Easy Scans',
                  textAlign: TextAlign.center,
                  style: context.headlineMedium
                      ?.copyWith(color: ColorConstant.primary)),
              const SizedBox(
                height: 20,
              ),
              Text('Get instant insights—no fuss, just results.',
                  textAlign: TextAlign.center,
                  style: context.bodyLarge?.copyWith(color: Colors.green)
                  // TextStyle(
                  //   color: Colors.black26,
                  //   fontSize: 18.0,
                  //   fontWeight: FontWeight.w600,
                  // ),
                  ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text('Your Vision, Your Journey',
                  textAlign: TextAlign.center,
                  style: context.headlineMedium
                      ?.copyWith(color: ColorConstant.primary)),
              const SizedBox(
                height: 20,
              ),
              Text('Personalized steps to keep your vision sharp.',
                  textAlign: TextAlign.center,
                  style: context.titleMedium
                      ?.copyWith(color: ColorConstant.lightGrey)),
            ],
          ),
        ),
      ],
    );
  }
}
