import 'package:carriera/Screens/All_Blogs_Screen.dart';
import 'package:carriera/Screens/Home_Screen.dart';
import 'package:carriera/Screens/Hotel_Screen.dart';
import 'package:carriera/Screens/More_Screen.dart';
import 'package:carriera/Screens/Tourism_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'All_Jobs_Screen.dart';
import 'Home_Box.dart';
import '../Widgets/FABBottomAppBarItem.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedItemIndex = 0;

  void _selectedTab(int index){
    setState(() {
      _selectedItemIndex=index;
    });
  }

  final List<Widget> _children = [
    HomeScreen(),
    TourismScreen(),
    HotelScreen(),
    MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_selectedItemIndex == 0) return true;
          setState(() {
            _selectedItemIndex = 0;
          });
          return false;
        },
        child: Scaffold(
          body:
          _children[_selectedItemIndex],
          bottomNavigationBar: FABBottomAppBar(
            //  onTabSelected: _selectedTab,
            items: [
              FABBottomAppBarItem(
                iconData: Icons.home,
                text: 'Home',
              ),
              FABBottomAppBarItem(iconData: Icons.tour, text: 'Tourism'),
              // FABBottomAppBarItem(iconData: Icons.king_bed, text: 'Hotel'),
              FABBottomAppBarItem(iconData: Icons.king_bed, text: 'Hotels'),
              FABBottomAppBarItem(
                  iconData: Icons.horizontal_split_sharp, text: 'More'),
            ],

            backgroundColor: Colors.white,
            centerItemText: 'Jobs',
            notchedShape: CircularNotchedRectangle(),
            color: Colors.black54,
            selectedColor: Color(0xff0e8ef7),
            onTabSelected: _selectedTab
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            height: 40.0.sp,
            width: 40.0.sp,
            child: new FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllJobsScreen(),
                    ));
              },
              child: Icon(
                Icons.work,
                color: Colors.white,
                size: 20.0.sp,
              ),
            ),
          ),
        ));
  }
}
