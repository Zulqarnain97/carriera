
import 'package:carriera/Screens/Home_Box.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer_util.dart';

import 'Screens/DashBoard.dart';
import 'Screens/Home_Screen.dart';

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
                      '/': (BuildContext context) => DashBoard(),



                    },
                  );
                },
              );
            },

      );
  }
}
