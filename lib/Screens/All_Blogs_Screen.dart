import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carriera/Models/Blogs_Model.dart';
import 'package:sizer/sizer.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;
import 'package:carriera/Screens/Blog_Details_Screen.dart';


class AllBlogsScreen extends StatefulWidget {
  @override
  _AllBlogsScreenState createState() => _AllBlogsScreenState();
}

class _AllBlogsScreenState extends State<AllBlogsScreen> {
   BlogsItem _blogsItem;

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

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 12.0.h,
              color: kSecondaryColor,
              child: Padding(
                padding: EdgeInsets.only(left: kDefaultPadding.sp, bottom: kDefaultPadding.sp/2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(

                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 19.0.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: kDefaultPadding.sp,),
                    Text(
                      'All Blogs',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0.sp
                      ),
                    ),
                  ],
                ),
              ),

            ),
            Container(
              height: 88.0.h,
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
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var bloggerName = snapshot.data[index]['name'];
                          var bloggerQuote = snapshot.data[index]['quote'];
                          // var blogDescription = snapshot.data![index]['description'];
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
                              margin: EdgeInsets.symmetric(vertical: kDefaultPadding.sp / 3, horizontal: kDefaultPadding.sp),
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
                                    color: Colors.black38,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: kDefaultPadding.sp / 2, horizontal: kDefaultPadding * 2),
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
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.0.sp),
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
                                                'Blog by:',
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10.0.sp),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                bloggerName /*'Zulqarnain Haider '*/,
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10.0.sp),
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
                  return Align(alignment: Alignment.center, child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}