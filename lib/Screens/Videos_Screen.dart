import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carriera/Widgets/Video_Player_Box.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;


class VideosScreen extends StatefulWidget {
  @override
  _VideosScreenState createState() => _VideosScreenState();
}
class _VideosScreenState extends State<VideosScreen> {

  List<String> videosList = [];
  var videoItem;


  Future<List<dynamic>> getVideosData() async {
    String url = 'https://hospitality92.com/api/getvideos';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    return json.decode(response.body)['videos'];

  }

  initState(){
    setState(() {
      getVideosData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  //color: Colors.red,
                  child:  FutureBuilder<List<dynamic>>(
                    future: getVideosData(),
                    builder: (context, snapshot) {
                      print(snapshot.hasData);
                      return ListView.builder(
                          shrinkWrap: true,
                          controller: new ScrollController(keepScrollOffset: false),
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            var video =  snapshot.data[index]['video'];
                            var link = snapshot.data[index]['link'];


                            for(int i=0 ; i<snapshot.data.length ; i++ ){
                              if(snapshot.data[index]['video'] != null){
                                var data = snapshot.data[index]['video'];
                                videosList.clear();
                                videosList.add(data);
                                videoItem = videosList.elementAt(0);

                                print("erfervrvr"+videosList.toString());
                                print("chal raha h");
                                print(data);
                              }

                            }

                            return Padding(
                              padding:   EdgeInsets.only(top: 4.0.sp, right: 4.0.sp),
                              child: Container(
                                  height: 30.0.h,

                                  child: Center(child: VideoItem('https://hospitality92.com/uploads/videos/$video'))

                              ),
                            );
                          });

                    },
                  ),

                ),
              )
            ],
          ),
        )
    );
  }

}