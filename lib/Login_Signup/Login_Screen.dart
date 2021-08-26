import 'package:carriera/Screens/DashBoard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';
import 'dart:convert';

import '../constants.dart';
import 'Forget_Password_Screen.dart';
import 'SignUp_Screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Map<String, String> _authData = {'email': '', 'password': ''};


   SharedPreferences _localStorage;
  List<String> citiesList = [];


  bool visible = false ;
  loadProgress(){
    if(visible == true){
      setState(() {
        visible = false;
      });
    }
    else{
      setState(() {
        visible = true;
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    final node = FocusScope.of(context);


    return Scaffold(
          backgroundColor: kSecondaryColor,
          appBar: AppBar(
            elevation: 0.0,
            toolbarHeight: 8.0.h,
            backgroundColor: kSecondaryColor,
            automaticallyImplyLeading: false,
            // leading: IconButton(
            //   icon: Icon(
            //     Icons.arrow_back_ios_outlined,
            //     color: Colors.white,
            //     size: 20.0.sp,
            //   ),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ),
          body: SingleChildScrollView(
              child: Form(
            key: formkey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding.sp / 2,
                  horizontal: kDefaultPadding.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 32.0.h,
                    width: 60.0.w,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeadingText('Login'),
                            HeadingText('To'),
                            HeadingText('Carriera'),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: kDefaultPadding.sp / 2,
                  ),
                  TextFormFieldContainer(
                    TextInputType.emailAddress,
                    email,
                    (value) {
                      _authData['email'] = value;
                    },
                    Icons.email,
                    'E-Mail',
                    () => node.nextFocus(),
                  ),
                  TextFormFieldContainer(TextInputType.visiblePassword, password,
                      (value) {
                    _authData['password'] = value;
                  }, Icons.lock, 'Password', () => node.nextFocus()),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ForgetPasswordScreen.routeName,
                      );
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: kDefaultPadding.sp / 2),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.white70,
                              fontFamily: "Merriweather Sans",
                              fontSize: 10.0.sp,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  SizedBox(
                    height: kDefaultPadding.sp * 2,
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
                            child: CircularProgressIndicator(backgroundColor: Colors.white,)
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding.sp),
                    child: InkWell(
                      child: Center(
                          child: GestureDetector(
                              onTap: () {
                                if (formkey.currentState.validate()) {
                                  LoginUser(
                                    email.text,
                                    password.text,
                                  );

                                  loadProgress();
                                  print('validated');

                                } else {
                                  print("Not Validated");
                                }
                                ;
                              },
                              child: Container(
                                height: 6.0.h,
                                width: 50.0.w,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0.sp)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Otomanopee One"),
                                ),
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding.sp / 2,
                  ),



                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          SignUpScreen.routeName,
                        );
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                              text: "New User?",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 9.0.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "  Register",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 10.0.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                      )),
                  Center(
                    child: Container(
                      height: 1.0.sp,
                      width: 20.0.w,
                      color: Colors.white70,
                      margin: EdgeInsets.only(top: kDefaultPadding.sp / 4),
                    ),
                  )
                ],
              ),
            ),
          )));
  }

  Widget TextFormFieldContainer(
    TextInputType type,
    TextEditingController controller,
    Function onSave,
    IconData icon,
    String hint,
    Function moveFocus,
  ) {
    return Container(
      height: 7.0.h,
      margin: EdgeInsets.only(
        top: kDefaultPadding.sp / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0.sp)),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding.sp / 2,
            vertical: kDefaultPadding.sp / 3),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            keyboardType: type,
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '    This Field Cannot Be Empty';
              }
              return null;
            },
            onSaved: onSave,
            style: TextStyle(
              fontFamily: "Mulish",
              fontSize: 12.0.sp,
            ),
            decoration: InputDecoration(
              errorStyle:
                  TextStyle(fontSize: 6.0.sp, fontFamily: 'Merriweather Sans'),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(fontFamily: "Mulish", fontSize: 10.0.sp),
              prefixIcon: Icon(
                icon,
                size: 18.0.sp,
              ),
            ),
            onEditingComplete: moveFocus,
          ),
        ),
      ),
    );
  }

  Widget HeadingText(String text) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 24.0.sp,
          color: Colors.white,
          fontFamily: "Otomanopee One",
          fontWeight: FontWeight.bold),
    );
  }

  Future<void> LoginUser(
    String email,
    String password,
  ) async {
    const url = 'https://hospitality92.com/api/login';


    final pref = await SharedPreferences.getInstance();

    pref.setBool("isLogIn", true );

    print('email = $email and password= $password');
    final response = await http.post(url,
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          'email': email,
          'password': password,
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
      print('Login Successful!');

      Future.delayed(Duration(microseconds: 100)).then((value){
        _showToast('Login Successful!');
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => DashBoard())
          );


      }
      );
      loadProgress();


    } else if (value1.toString() == '"status":"403"') {
      print('Email Or Password Incorrect!');
      loadProgress();
      _showToast('Email Or Password Incorrect!');
    } else
     { print('error');}

    print("Following is res:-" + response.body.toString());

    Map<String, dynamic> map = json.decode(response.body);
    print("getting data= " + map["userdata"]["name"]);

    pref.setInt("userID", map["userdata"]["id"]);
    pref.setString("userName", map["userdata"]["name"]);
    pref.setString("userTitle", map["userdata"]["jobtitle"]);
    pref.setString("userDOB", map["userdata"]["dob"]);
    pref.setString("userEmail", map["userdata"]["email"]);
    pref.setString("userMobile", map["userdata"]["mobile"]);

  }

  _showToast(String text){
    return Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 12.0.sp
    );
  }


}
