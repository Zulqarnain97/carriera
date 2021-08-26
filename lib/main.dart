
import 'package:carriera/Login_Signup/Login_Screen.dart';
import 'package:carriera/Login_Signup/SignUp_Screen.dart';
import 'package:carriera/Login_Signup/SignUp_Screen_Two.dart';
import 'package:carriera/Screens/All_Jobs_Screen.dart';
import 'package:carriera/Screens/Apply_For_Job_Screen.dart';
import 'package:carriera/Screens/Home_Box.dart';
import 'package:carriera/Screens/More_Screen.dart';

import 'package:carriera/Screens/Tourism_Screen.dart';
import 'package:carriera/Screens/Test_Screen.dart';
import 'package:carriera/Screens/Videos_Screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer_util.dart';

import 'Login_Signup/Forget_Password_Screen.dart';
import 'Screens/DashBoard.dart';
import 'Screens/Home_Screen.dart';
import 'package:carriera/Screens/All_Blogs_Screen.dart';

import 'Screens/Splash_Screen.dart';


void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return
      LayoutBuilder(                           //return LayoutBuilder
            builder: (context, constraints) {
              return OrientationBuilder(                  //return OrientationBuilder
                builder: (context, orientation) {
                  //initialize SizerUtil()
                  SizerUtil().init(constraints, orientation);  //initialize SizerUtil
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    locale: DevicePreview.locale(context), // Add the locale here
                    builder: DevicePreview.appBuilder,
                    initialRoute: '/',
                    routes: {
                      '/': (BuildContext context) => SplashScreen(),
                      '/login_screen': (BuildContext context) => LoginScreen(),
                      '/signup_screen': (BuildContext context) => SignUpScreen(),
                      '/signup_screen_two': (BuildContext context) => SignUpScreenTwo(),
                      '/forget_password_screen': (BuildContext context) => ForgetPasswordScreen(),
                      '/more_screen': (BuildContext context) => MoreScreen(),



                    },
                  );
                },
              );
            },

      );
  }
}
