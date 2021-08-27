import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
import 'package:carriera/Providers/Blogs_Provider.dart';
import 'package:carriera/Widgets/Blog_Overview_Card.dart';
class HomeBox extends StatefulWidget {
  @override
  _HomeBoxState createState() => _HomeBoxState();
}

class _HomeBoxState extends State<HomeBox> {

  int currentPos = 0;

  Future<List<dynamic>> getHomeSliderData() async {
    String url = 'https://hospitality92.com/api/gethomeslider';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    return json.decode(response.body)['homeslider'];
  }



   JobModel jobItem;



  Future<List<dynamic>> getJobsData() async {
    String url = 'https://hospitality92.com/api/jobsbycategory/All';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    return json.decode(response.body)['jobs'];
  }




   var _isInit = true;
   var _isLoading = false;

   @override
   void initState() {
     // TODO: implement initState
     Provider.of<BlogsProvider>(context, listen: false)
         .fetchBlogs()
         .then((value) {
       if (value) setState(() {});
     });
     super.initState();
   }

   @override
   void didChangeDependencies() {
     if (_isInit) {
       setState(() {
         _isLoading = true;
       });

       Provider.of<BlogsProvider>(context, listen: false)
           .fetchBlogs()
           .then((value) {
         setState(() {
           _isLoading = false;
         });
       });
     }
     _isInit = false;
     super.didChangeDependencies();
   }
  @override
  Widget build(BuildContext context) {
    final b = Provider.of<BlogsProvider>(context, listen: false).b;
    return Scaffold(

      body: Container(
        height: 78.0.h,
        color: Colors.black.withOpacity(0.1),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                height: 28.0.h,
                width: 100.0.w,
                color: Colors.transparent,
                child: FutureBuilder<List<dynamic>>(
                  future: getHomeSliderData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                /*Stack()*/
                                Container(
                                  height: 24.0.h,
                                  width: 100.0.w,
                                  child: CarouselSlider.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, itemIndex, realIndex) {
                                        var sliderImages = snapshot.data[itemIndex]['image'];

                                        return Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black54,
                                            ),
                                          child: Image.network('https://hospitality92.com/public/home_slider/image/$sliderImages',
                                          fit: BoxFit.cover,
                                          width: double.infinity,

                                          ),

                                        );
                                      },
                                      options: CarouselOptions(
                                        enlargeCenterPage: true,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            currentPos = index;
                                          });
                                        },
                                        autoPlay: true,
                                      )
                                  ),
                                ),
                                Container(

                                  height: 2.0.h,

                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: snapshot.data.map((url) {
                                        int index = snapshot.data.indexOf(url);
                                        return Container(
                                          width: 4.0.sp,
                                          height: 4.0.sp,
                                          margin: EdgeInsets.symmetric(horizontal: 1.0.sp),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: currentPos == index ? kPrimaryColor : Color.fromRGBO(0, 0, 0, 0.4),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }
                    return Center(child: CircularProgressIndicator());
                  },
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

                child:  _isLoading
                    ? Align(
                  alignment: Alignment.topCenter,
                  child: CircularProgressIndicator(),
                )
                    : ListView.builder(
                  itemCount: 2,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    // builder: (c) => workOut[i],
                    value: b[i],
                    child: BlogCard(),
                  ),
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