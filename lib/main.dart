
import 'package:carriera/Login_Signup/Login_Screen.dart';
import 'package:carriera/Login_Signup/SignUp_Screen.dart';
import 'package:carriera/Login_Signup/SignUp_Screen_Two.dart';
import 'package:carriera/Screens/All_Blogs_Screen.dart';
import 'package:carriera/Screens/Blog_Details_Screen.dart';

import 'package:carriera/Screens/More_Screen.dart';


import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer_util.dart';
import 'package:carriera/Providers/Blogs_Provider.dart';
import 'Login_Signup/Forget_Password_Screen.dart';


import 'Screens/Splash_Screen.dart';

import 'package:carriera/Providers/Videos_Provider.dart';
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
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(
        create: (ctx) => VideosProvider(),
    ),
          ChangeNotifierProvider(
            create: (ctx) => BlogsProvider(),
          ),

    ],
    child:
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
                      '/blog_details_screen': (BuildContext context) => BlogDetailScreen(),



                    },
                  );
                },
              );
            },

      )  );
  }
}
