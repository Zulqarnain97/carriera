import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Screens/Home_Screen.dart';
import 'Widgets/FABBottomAppBarItem.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: FABBottomAppBar(
        //  onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(
            iconData: Icons.home,
            text: 'Home',
          ),
          FABBottomAppBarItem(iconData: Icons.hearing, text: 'Tourism'),
          FABBottomAppBarItem(iconData: Icons.king_bed, text: 'Hotel'),
          FABBottomAppBarItem(
              iconData: Icons.horizontal_split_sharp, text: 'More'),
        ],

        backgroundColor: Colors.white,
        centerItemText: 'Jobs',
        notchedShape: CircularNotchedRectangle(),
        color: Colors.black54,
        selectedColor: Color(0xff0e8ef7),
        onTabSelected: (int value) {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 40.0.sp,
        width: 40.0.sp,
        child: new FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.work,
            color: Colors.white,
            size: 20.0.sp,
          ),
        ),
      ),
    );
  }
}
