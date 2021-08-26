import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:carriera/Models/Jobs_Model.dart';

import '../constants.dart';
import 'package:carriera/Screens/All_Blogs_Screen.dart';
import 'package:carriera/Screens/All_Jobs_Screen.dart';
import 'Jobs_Detail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carriera/Screens/Blog_Details_Screen.dart';
import 'package:carriera/Models/Blogs_Model.dart';

class HomeBox extends StatefulWidget {
  @override
  _HomeBoxState createState() => _HomeBoxState();
}

class _HomeBoxState extends State<HomeBox> {

  BlogsItem _blogsItem;



   JobModel jobItem;

   final List<String> imgList = [
     'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8am9ic3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
     'https://images.unsplash.com/photo-1476231790875-016a80c274f3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8am9ic3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
     'https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8am9ic3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
   ];

  Future<List<dynamic>> getJobsData() async {
    String url = 'https://hospitality92.com/api/jobsbycategory/All';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    return json.decode(response.body)['jobs'];
  }

  Future<List<dynamic>> getBlogsData() async {
    String url = 'https://hospitality92.com/api/blogsbycategory_and_city/Tourism/1';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    return json.decode(response.body)['blogs'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: 78.0.h,
        color: Colors.black.withOpacity(0.1),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                height: 25.0.h,
                width: 100.0.w,

                child: CarouselSlider(

                  options: CarouselOptions(autoPlay: true),
                  items: imgList.map((item) => Container(
                    child: Image.network(item, fit: BoxFit.cover, width: 100.0.w)

                  )).toList(),
                ),
              ),
              CategoryTitleContainer(Colors.transparent, 'Latest Jobs', 15.0.sp, 0.0.sp, (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllJobsScreen(),
                    )
                );
              }),
              Container(
                color: Colors.transparent,
                height: 27.0.h,
                child: FutureBuilder<List<dynamic>>(
                    future: getJobsData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding.sp/2, vertical: kDefaultPadding.sp/5),
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                var title = snapshot.data[index]['title'];
                                var company = snapshot.data[index]['company_name'];
                                var type = snapshot.data[index]['type'];
                                var min_salary = snapshot.data[index]['min_salary'];
                                var max_salary = snapshot.data[index]['max_salary'];

                                jobItem = JobModel.fromDocument(snapshot, index);
                                return GestureDetector(
                                  onTap: () {
                                    jobItem = JobModel.fromDocument(snapshot, index);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => JobsDetail(jobItem),
                                        ));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: kDefaultPadding.sp/2,
                                      right: kDefaultPadding.sp/2,
                                      bottom: kDefaultPadding.sp/2,
                                    ),
                                    child: Material(
                                      elevation: 2,
                                      borderRadius: BorderRadius.circular(kBorderRadius.sp/2),
                                      child: Container(
                                        height: 11.0.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(kBorderRadius.sp/2),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: kBorderRadius.sp/2),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: 4.0.h,
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      /*'Senior Developer'*/
                                                      title,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(color: Colors.black87, fontSize: 12.0.sp, fontWeight: FontWeight.w800),
                                                    ),
                                                  )),
                                              Container(
                                                height: 3.0.h,
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.monetization_on_outlined,
                                                      color: Colors.grey,
                                                      size: 12.0.sp,
                                                    ),
                                                    SizedBox(
                                                      width: kDefaultPadding.sp/2,
                                                    ),
                                                    Text(
                                                      "Rs. " + min_salary + " -"  + max_salary,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(color: Colors.grey, fontSize: 10.0.sp, fontWeight: FontWeight.w600),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                  height: 3.0.h,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.home_outlined,
                                                        color: Colors.grey,
                                                        size: 12.0.sp,
                                                      ),
                                                      SizedBox(
                                                        width: kDefaultPadding.sp/2,
                                                      ),
                                                      Text(
                                                        /*'Islamabad, Pakistan'*/
                                                        company,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(color: Colors.grey, fontSize: 10.0.sp, fontFamily: 'Mulish', fontWeight: FontWeight.w600),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        width: 18.0.w,
                                                        height: 3.0.h,
                                                        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(kBorderRadius.sp/2)),
                                                        child: Center(
                                                          child: Text(
                                                            /*'Full-time'*/
                                                            type,
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(color: Colors.white, fontSize: 8.0.sp, fontFamily: 'Mulish', fontWeight: FontWeight.w600),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },

                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },

                ),
              ),
              CategoryTitleContainer(Colors.white, 'Popular Blog', 0.0.sp, 15.0.sp, (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllBlogsScreen(),
                    )
                );
              }),
              Container(

                height: 30.0.h,
                color: Colors.white,

                child: FutureBuilder<List<dynamic>>(
                  future: getBlogsData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          controller: new ScrollController(keepScrollOffset: false),
                          scrollDirection: Axis.vertical,
                          itemCount: 2,

                          itemBuilder: (context, index) {
                            var bloggerName = snapshot.data[index]['name'];
                            var bloggerQuote = snapshot.data[index]['quote'];
                            var blogDescription = snapshot.data[index]['description'];
                            var blogImage = 'https://hospitality92.com/uploads/products/${snapshot.data[index]['image']}';

                            return InkWell(
                              onTap: () {
                                _blogsItem = BlogsItem.fromDocument(snapshot, index);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlogDetailScreen(_blogsItem),
                                    )
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: kDefaultPadding.sp/3, horizontal: kDefaultPadding.sp),
                                child: Stack(children: [
                                  Container(
                                    height: 28.0.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(kBorderRadius.sp),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(kBorderRadius.sp),
                                      child: Image.network(
                                        blogImage,
                                        /*'https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhvdG9ncmFwaGVyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',*/
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 28.0.h,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(kBorderRadius.sp),
                                      color: Colors.black12,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: kDefaultPadding.sp / 2, horizontal: kDefaultPadding*2),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(

                                            height: 12.0.h,
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                bloggerQuote,
                                                /*
                                          'Photographers are going to earn more this year Photographers are going to earn more this year Photographers are going to earn more this year ',
                                          */
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.0.sp),
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
                                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 10.0.sp),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  bloggerName /*'Zulqarnain Haider '*/,
                                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10.0.sp),
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
                          });
                    }
                    return Align(
                        alignment: Alignment.topCenter,
                        child: CircularProgressIndicator());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTab(
      String text,
      ) {
    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding.sp/2),
      width: 26.0.w,
      height: 4.0.h,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0.sp)),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.w500, color: Color(0xff090577)),
        ),
      ),
    );
  }

  Widget CategoryTitleContainer(Color color, String title, double containerMargin, double rowPadding, Function seeAll) {
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
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 13.0.sp),
            ),
            GestureDetector(
              onTap: seeAll,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0.sp / 4),
                width: 20.0.w,
                child: Center(
                  child: Text(
                    'See All',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 9.0.sp),
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}