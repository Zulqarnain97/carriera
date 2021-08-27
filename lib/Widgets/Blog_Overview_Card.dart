import 'package:carriera/Screens/Blog_Details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:carriera/Providers/Blogs_Provider.dart';
import 'package:carriera/Models/Blogs_Model.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../constants.dart';

class BlogCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blogData = Provider.of<BlogsModel>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(BlogDetailScreen.routeName, arguments: blogData.blogID);
      },
      child: Container(
        width: 80.0.w,
        margin: EdgeInsets.symmetric(
            horizontal: kDefaultPadding.sp,
            vertical: kDefaultPadding.sp/2
        ),
        child: Stack(children: [
          Container(
            height: 28.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius.sp),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius.sp),
              child: Image.network(
                blogData.bloggerImage,
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
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding.sp / 2,
                  horizontal: kDefaultPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 12.0.h,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        blogData.bloggerQuote,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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
                          'Blog by:',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          blogData.bloggerName /*'Zulqarnain Haider '*/,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
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

class TourismBlogCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blogData = Provider.of<BlogsModel>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(BlogDetailScreen.routeName, arguments: blogData.blogID);
      },
      child: Container(
        width: 90.0.w,
        margin: EdgeInsets.symmetric(
            horizontal: kDefaultPadding.sp/5,
            vertical: kDefaultPadding.sp/5
        ),
        child: Stack(children: [
          Container(
            height: 28.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius.sp/3),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius.sp/3),
              child: Image.network(
                blogData.bloggerImage,
                /*'https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhvdG9ncmFwaGVyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',*/
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            height: 28.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius.sp/3),
              color: Colors.black38,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding.sp / 2,
                  horizontal: kDefaultPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 12.0.h,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        blogData.bloggerQuote,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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
                          'Blog by:',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          blogData.bloggerName /*'Zulqarnain Haider '*/,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
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