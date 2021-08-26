import 'package:flutter/material.dart';
import 'package:carriera/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:carriera/Login_Signup/Login_Screen.dart';
import 'dart:async';
import 'dart:convert';
import 'package:sweetalert/sweetalert.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = '/forget_password_screen';

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  bool visible = false;

  loadProgress() {
    if (visible == true) {
      setState(() {
        visible = false;
      });
    } else {
      setState(() {
        visible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 8.0.h,
          backgroundColor: kSecondaryColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
              size: 20.0.sp,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding.sp * 2,
                vertical: kDefaultPadding.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 45.0.h,
                  width: 100.0.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.lock_outline_rounded,
                        size: 100.0.sp,
                        color: Colors.white,
                      ),
                      Text(
                        "Forget Password ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0.sp,
                            color: Colors.white,
                            fontFamily: "Otomanopee One",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: kDefaultPadding.sp,
                      ),
                      Text(
                        "Provide Your Account E-Mail To Reset Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10.0.sp,
                            color: Colors.white,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding * 2,
                ),
                Container(
                  height: 7.0.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0.sp)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding.sp / 2),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '    Enter E-Mail';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 12.0.sp,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          errorStyle: TextStyle(
                            fontSize: 6.0.sp,
                          ),
                          hintText: 'E-Mail',
                          hintStyle: TextStyle(fontSize: 10.0.sp),
                          prefixIcon: Icon(
                            Icons.email,
                            size: 18.0.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding.sp/2,
                ),
                Center(
                  //color: Colors.white,
                  child: Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(top: 5, bottom: 12),
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ))),
                ),
                InkWell(
                  child: Center(
                      child: GestureDetector(
                          onTap: () {
                            if (formkey.currentState.validate()) {
                              print("Validated");
                              ResetPassword(email.text);
                              loadProgress();
                            } else {
                              print("Not Validated");
                            }
                            ;
                          },
                          child: Container(
                            height: 6.0.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0.sp)),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Otomanopee One"),
                            ),
                          ))),
                ),
              ],
            ),
          ),
        )));
  }

  Future<void> ResetPassword(
    String email,
  ) async {
    const url = 'https://hospitality92.com/api/forgetpassword';

    print('email = $email');
    final response = await http.post(url,
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          'email': email,
        }));
    var data = json.decode(response.body);
    print('printing post');
    print(data);
    print(response.statusCode);
    var res = (response.body.substring(1, response.body.length - 1));
    final split = res.split(',');
    final Map<int, String> values = {
      for (int i = 0; i < split.length; i++) i: split[i]
    };
    final value1 = values[0];
    if (value1.toString() == '"status":"200"') {

      print('Password Reset Email has been sent!');

      Future.delayed(Duration(microseconds: 100)).then((value) {

        SweetAlert.show(this.context,
            title: "Password Reset Email has been sent!",

            // subtitle: "Check your Email and reset your password!",
            style: SweetAlertStyle.success, onPress: (bool isConfirmed) {
          if (isConfirmed)
            Navigator.of(this.context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen()));
          Navigator.pop(context);
          _showToast('Check your Email and reset your password!');
          // return false;
        });

        // Navigator.popUntil(context, ModalRoute.withName("/login_screen"));

        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => LoginScreen()));
      });
      loadProgress();

    } else if (value1.toString() == '"status":"403"') {
      print('Email not available or you are not registered with us!');
      loadProgress();
      // _showToast('Email not available or you are not registered with us!');
      SweetAlert.show(this.context,
          title: "Sorry Dear User",
          subtitle: "Email not available or you are not registered with us!",
          style: SweetAlertStyle.error);
    } else {
      print('error');
    }

    print("Following is res:-" + response.body.toString());

    Map<String, dynamic> map = json.decode(response.body);
  }

  _showToast(String text) {
    return Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white60,
        textColor: Colors.black54,
        fontSize: 12.0.sp);
  }
}
