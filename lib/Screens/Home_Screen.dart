import 'package:carriera/Screens/Home_Box.dart';
import 'package:carriera/Screens/Hotel_Screen.dart';
import 'package:carriera/Screens/More_Screen.dart';
import 'package:carriera/Screens/Restaurents_Screen.dart';
import 'package:carriera/Screens/Tourism_Screen.dart';
import 'package:carriera/Screens/Videos_Screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants.dart';
import 'package:carriera/Screens/Others_Screen.dart';
import 'package:carriera/Screens/Hotel_Screen.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
              Padding(
                padding: EdgeInsets.only(top: kDefaultPadding.sp*2-15.0.sp, bottom: kDefaultPadding.sp/6),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TabButton(
                        text: "Hospitality",
                        pageNumber: 0,
                        selectedPage: _selectedPage,
                        onPressed: () {
                          _changePage(0);
                        },
                      ),
                      TabButton(
                        text: "Restaurents",
                        pageNumber: 1,
                        selectedPage: _selectedPage,
                        onPressed: () {
                          _changePage(1);
                        },
                      ),
                      TabButton(
                        text: "Hotels",
                        pageNumber: 2,
                        selectedPage: _selectedPage,
                        onPressed: () {
                          _changePage(2);
                        },
                      ),
                      TabButton(
                        text: "Others",
                        pageNumber: 3,
                        selectedPage: _selectedPage,
                        onPressed: () {
                          _changePage(3);
                        },
                      ),
                    ],
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
                  HomeBox(),
                  RestaurentsScreen(),
                  HotelScreen(),
                  OthersScreen(),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

