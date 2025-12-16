
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/service/DI/di_service.dart';
import 'package:eyeinsider/service/navigation/navigation_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:eyeinsider/views/splash_and_onboarding/splash_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main()  async{
SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        // statusBarColor: Colors.black, 
        /// status bar color
      // statusBarColor: ColorConstant.scaffoldBackgroundColor,
        // systemNavigationBarColor: ColorConstant.scaffoldBackgroundColor,
        
        // statusBarBrightness:  Brightness.dark,
        // systemNavigationBarIconBrightness: Brightness.dark, // Icon Color
      ),

      
    );
   

     
     WidgetsFlutterBinding.ensureInitialized();

    DI.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: AppProvider.getProviders(),
        child: MaterialApp(
          navigatorKey:  DI.i<NavigationService>().navigationKey, // Ensure this is correctly set,
            debugShowCheckedModeBanner: false,
          title: 'Eye Insider',
          // theme: CustomThemeData. getThemeData(),
          theme: ThemeData(
          scaffoldBackgroundColor: ColorConstant.scaffoldBackgroundColor ,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
