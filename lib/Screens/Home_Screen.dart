import 'package:carriera/Widgets/Blog_Overview_Card.dart';
import 'package:carriera/Widgets/Job_Overview_Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0.h,
      color: Colors.black.withOpacity(0.1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xff090577),
              height: 12.0.h,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.sp, horizontal: 10.0.sp),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildTab('Hotel'),
                        buildTab('Restaurant'),
                        buildTab('News'),
                        buildTab('Videos'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            CategoryTitleContainer(Colors.transparent, 'Latest Jobs', 15.0.sp, 0.0.sp),
            Container(
              color: Colors.transparent,
              height: 37.0.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    JobOverviewCard(),
                    JobOverviewCard(),
                    JobOverviewCard(),
                  ],
                ),
              ),
            ),
            CategoryTitleContainer(Colors.white, 'Popular Blog', 0.0.sp, 15.0.sp),
            Container(
              color: Colors.white,
              height: 28.0.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    BlogOverviewCard(),
                    BlogOverviewCard(),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
Widget buildTab(String text, ){
    return Container(

margin: EdgeInsets.only(left: 6.0.sp),
      width: 24.0.w, height: 4.0.h,
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0.sp)),
    child: Align(
        alignment: Alignment.center,
        child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10.0.sp,
            fontWeight: FontWeight.w500,
                color: Color(0xff090577)
            ),

        ),
        ),
    );
}
  Widget CategoryTitleContainer(
      Color color, String title, double containerMargin, double rowPadding) {
    return Container(
      color: color,
      margin: EdgeInsets.symmetric(horizontal: containerMargin),
      height: 7.0.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: rowPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,

                  fontWeight: FontWeight.w800,
                  fontSize: 13.0.sp),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0.sp/4),
              width: 24.0.w,
              child: Center(
                child: Text(
                  'Explore',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,

                      fontWeight: FontWeight.bold,
                      fontSize: 10.0.sp),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.0.sp/2)),
            ),
          ],
        ),
      ),
    );
  }
}
