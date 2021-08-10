import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class BlogOverviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        height: 25.0.h,
        decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(kBorderRadius.sp)),
        margin: EdgeInsets.symmetric(
            vertical: kDefaultPadding.sp / 2, horizontal: kDefaultPadding.sp),
        child: Stack(children: [
          Container(
            height: 25.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius.sp),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius.sp),
              child: Image.network(
                'https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhvdG9ncmFwaGVyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            height: 25.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius.sp),
              color: Colors.black12,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding.sp / 3,
                  horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 12.0.h,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Photographers are going to earn more this year Photographers are going to earn more this year Photographers are going to earn more this year ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0.sp),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    height: 4.0.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Author:',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 10.0.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Zulqarnain Haider ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.0.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
