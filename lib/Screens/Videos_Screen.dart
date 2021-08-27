import 'package:carriera/Widgets/Video_Player_Box.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:carriera/Models/Videos_Model.dart';
import 'package:carriera/Providers/Videos_Provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class VideosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: VideosGroup(),

    );
  }
}

class VideosGroup extends StatefulWidget {
  @override
  _VideosGroupState createState() => _VideosGroupState();
}

class _VideosGroupState extends State<VideosGroup> {
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

    return Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 78.0.h,

          child: _isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(
            itemCount: wat.length,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              // builder: (c) => workOut[i],
              value: wat[i],
              child: VideoBox(),
            ),
          ),
        ));
  }
}



class VideoBox extends StatefulWidget {






  @override
  _VideoBoxState createState() => _VideoBoxState();
}

class _VideoBoxState extends State<VideoBox> {



  @override
  Widget build(BuildContext context) {
    final testData = Provider.of<VideosModel>(context, listen: false);


    return Container(
        height: 29.0.h,
        width: 100.0.w,

        child: VideoItem(testData.video != null ? 'https://hospitality92.com/uploads/videos/' + testData.video : 'https://hospitality92.com/uploads/products/1624530723.mp4', )

    );
  }
}
