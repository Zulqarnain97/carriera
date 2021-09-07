import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants.dart';

class TabButton extends StatelessWidget {
  final String text;
  final int selectedPage;
  final int pageNumber;
  final Function onPressed;
  TabButton({this.text, this.selectedPage, this.pageNumber, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(
            milliseconds: 1000
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        margin: EdgeInsets.only(left: kDefaultPadding.sp/2, top: kDefaultPadding.sp/4),
        width: 26.0.w,
        height: 4.0.h,
        decoration: BoxDecoration(
          color: selectedPage == pageNumber ? kPrimaryColor : kPrimaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(kBorderRadius.sp),
        ),
        // padding: EdgeInsets.symmetric(
        //   vertical: selectedPage == pageNumber ? kDefaultPadding.sp/6 : 0,
        //   horizontal: selectedPage == pageNumber ? kDefaultPadding.sp/6 : 0,
        // ),

        child: Center(
          child: Text(
            text ?? "Tab Button",
            style: TextStyle(
              fontSize: 12.0.sp,
              color: selectedPage == pageNumber ? Colors.white : Colors.white30,
            ),
          ),
        ),
      ),
    );
  }
}