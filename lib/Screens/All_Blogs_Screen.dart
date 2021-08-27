import 'package:carriera/Models/Blogs_Model.dart';
import 'package:carriera/Widgets/Blog_Overview_Card.dart';
import 'package:carriera/Widgets/Video_Player_Box.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:carriera/Models/Videos_Model.dart';
import 'package:carriera/Providers/Videos_Provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:carriera/Providers/Blogs_Provider.dart';
import 'package:carriera/Screens/Blog_Details_Screen.dart';
import '../constants.dart';

class AllBlogsScreen extends StatefulWidget {
  @override
  _AllBlogsScreenState createState() => _AllBlogsScreenState();
}

class _AllBlogsScreenState extends State<AllBlogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 14.0.h,
                  color: kSecondaryColor,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: kDefaultPadding.sp,
                          bottom: kDefaultPadding.sp / 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
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
                          SizedBox(
                            width: kDefaultPadding.sp,
                          ),
                          Text(
                            'Latest Blogs',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0.sp),
                          ),
                        ],
                      ))),
              BlogsGroup(),
            ],
          ),
        ));
  }
}

class BlogsGroup extends StatefulWidget {
  @override
  _BlogsGroupState createState() => _BlogsGroupState();
}

class _BlogsGroupState extends State<BlogsGroup> {
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

    return Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 86.0.h,
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: b.length,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    // builder: (c) => workOut[i],
                    value: b[i],
                    child: BlogCard(),
                  ),
                ),
        ));
  }
}


