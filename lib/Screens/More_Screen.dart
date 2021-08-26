import 'package:carriera/Login_Signup/Login_Screen.dart';
import 'package:carriera/Screens/All_Jobs_Screen.dart';
import 'package:carriera/Screens/Applied_Jobs.dart';
import 'package:carriera/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MoreScreen extends StatefulWidget {
  static const routeName='/more_screen';
  const MoreScreen({Key key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  Future fetch() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove("isLogIn");

    // Navigator.of(context).popUntil(ModalRoute.withName('/more_screen'));

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 90.0.h,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8.0.h,
              ),
              categoryListCard('Applied Jobs', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppliedJobs(),
                    ));
              }),
              categoryListCard('Help Center', () {}),
              categoryListCard('Contact Us', () {}),
              categoryListCard('About Us', () {}),
              categoryListCard('Sign out', () {
                 // fetch();
                showAlertDialog(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryListCard(categoryName, onPress) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
            bottom: kDefaultPadding.sp / 2,
            left: kDefaultPadding.sp / 2,
            right: kDefaultPadding.sp / 2),
        height: 8.0.h,
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(kBorderRadius.sp)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding.sp / 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style: TextStyle(
                    fontSize: 12.0.sp,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.blueGrey,
                size: 14.0.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        fetch();
        Navigator.pop(context);

      },
    );

    Widget noButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      //title: Text("Simple Alert"),
      content: Text("Do you want to Logout ?"),
      actions: [okButton, noButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
