import 'package:carriera/Screens/Hotel_Screen.dart';
import 'package:carriera/Screens/More_Screen.dart';
import 'package:carriera/Screens/Restaurents_Screen.dart';
import 'package:carriera/Screens/Tourism_Screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:carriera/constants.dart';
import 'package:carriera/Screens/Hotel_Screen.dart';
import 'All_Jobs_Screen.dart';
import 'Home_Screen.dart';
import 'Videos_Screen.dart';

class DashBoard extends StatefulWidget{
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  int _selectedItemIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    TourismScreen(),
    VideosScreen(),
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
          backgroundColor: Colors.white,
          body: Container(

            child: Stack(
              children: [
                _children[_selectedItemIndex],
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(

                    height: 12.0.h,
                    width: 100.0.w,
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        CustomPaint(
                          size: Size(100.0.w, 12.0.h),
                          painter: BNBCustomPainter(),
                        ),
                        Center(
                          heightFactor: 0.6,
                          child: Container(
                              height: 44.0.sp,
                              width: 44.0.sp,
                              child: FloatingActionButton(backgroundColor: kSecondaryColor, child: Icon(Icons.work, size: 22.0.sp,), elevation: 4.0, onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AllJobsScreen(),
                                    ));
                              })),
                        ),
                        Container(
                          width: 100.0.w,
                          height: 12.0.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BuildNavBarItem(Icons.home, 0, 'Home'),
                              BuildNavBarItem(Icons.tour, 1, 'Tourism'),

                              Container(
                                width: 20.0.w,
                              ),
                              BuildNavBarItem(Icons.video_collection, 2, 'Videos'),
                              BuildNavBarItem(Icons.more, 3, 'More'),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
  Widget BuildNavBarItem(IconData icon, int index, String name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(

        width: 20.0.w,


        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: index == _selectedItemIndex ? 18.0.sp : 16.0.sp,
                color: index == _selectedItemIndex ? kSecondaryColor : kGrayColor,
              ),
              SizedBox(
                height: 1.0.sp,
              ),
              Text(
                name,
                style: TextStyle(
                  color:
                  index == _selectedItemIndex ? kSecondaryColor : kGrayColor,
                  fontSize: index == _selectedItemIndex ? 10.0.sp : 10.0.sp,

                ),
              )
            ]),
      ),
    );
  }
}
class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 10, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


