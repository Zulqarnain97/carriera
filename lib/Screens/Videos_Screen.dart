import 'package:carriera/Widgets/Video_Box.dart';
import 'package:carriera/Widgets/Video_Player_Box.dart';
import 'package:carriera/constants.dart';
import 'package:carriera/Models/Videos_Model.dart';
import 'package:carriera/Providers/Videos_Provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosScreen extends StatefulWidget {
  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<VideosProvider>(context, listen: false)
        .fetchVideos()
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

      Provider.of<VideosProvider>(context, listen: false)
          .fetchVideos()
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
    final wat = Provider.of<VideosProvider>(context, listen: false).t;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        toolbarHeight: 7.0.h,
        title: Center(
          child: Text('Videos', style: TextStyle(
            fontSize: 14.0.sp
          ),),
        ),
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 88.0.h,
            color: Colors.transparent,
            child: _isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
              itemCount: wat.length,
              padding: EdgeInsets.only(bottom: kDefaultPadding.sp * 4),
              scrollDirection: Axis.vertical,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: wat[i],
                child: VideoBox(),
              ),
            ),
          )),
    );
  }
}




