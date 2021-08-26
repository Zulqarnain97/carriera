import 'dart:async';

import 'package:carriera/Login_Signup/Login_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'DashBoard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    fetch();
  }

  Future fetch() async {
    final pref = await SharedPreferences.getInstance();
    final status = pref.getBool("isLogIn");

    if (status == true) {
      Timer(const Duration(milliseconds: 3000), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashBoard()));
      });
    }else{
      Timer(const Duration(milliseconds: 3000), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        height: 100.0.h,
        width: 100.0.w,
        child: Padding(
          padding:   EdgeInsets.all(16.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 1,
              ),
              Container(

                  width: 90.0.w, height: 10.0.h,
                  child: Image.asset("assets/logo.png", width: double.infinity, )
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                  child: CircularProgressIndicator()
              ),
            ],
          ),
        ),

      ),
    );
  }
}
