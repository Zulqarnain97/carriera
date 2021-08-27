import 'package:carriera/Screens/Destinations_Box.dart';
import 'package:carriera/Screens/Home_Box.dart';
import 'package:carriera/Screens/Hotel_Screen.dart';
import 'package:carriera/Screens/More_Screen.dart';
import 'package:carriera/Screens/Tourism_Box.dart';
import 'package:carriera/Screens/Tourism_Screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants.dart';

class TourismScreen extends StatefulWidget {
  @override
  _TourismScreenState createState() => _TourismScreenState();
}

class _TourismScreenState extends State<TourismScreen> {

  int _selectedPage = 0;
  PageController _pageController;

  void _changePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
      _pageController.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(
              color: Color(0xff090577),
              height: 12.0.h,
              width: 100.0.w,
              child:
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: kDefaultPadding.sp*2-15.0.sp, bottom: kDefaultPadding.sp/6),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TabButton(
                          text: "Tourism",
                          pageNumber: 0,
                          selectedPage: _selectedPage,
                          onPressed: () {
                            _changePage(0);
                          },
                        ),
                        TabButton(
                          text: "Destinations",
                          pageNumber: 1,
                          selectedPage: _selectedPage,
                          onPressed: () {
                            _changePage(1);
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (int page) {
                  setState(() {
                    _selectedPage = page;
                  });
                },
                controller: _pageController,
                children: [
                  TourismBox(),
                  DestinationsBox()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

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