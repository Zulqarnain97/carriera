import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carriera/Widgets/Video_Player_Box.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;


class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}
class _TestScreenState extends State<TestScreen> {

  List data;
  List<Map> filteredList;


  Future<String> theRequest() async {
    var response = await http.get(Uri.encodeFull('https://hospitality92.com/api/getvideos'),
        headers: {
          'Accept': 'application/json'
        });

    setState(() {

      var getRequestedData = jsonDecode(response.body);
      data = getRequestedData['videos'];

      filteredList = List();
      // for(String i=0 ; i<data.length ; i++ ){
      //   if (i['video'] != null && item['locationForDisplay']['latitude'] != null && item['locationForDisplay']['longitude'] != null
      //   ) {
      //     filteredList.add(item);
      //   }
      // }

    });
  }

  @override
  void initState() {
    this.theRequest();
  }

  @override
  Widget build(BuildContext context) {

    bool notNull = false;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Parking Spots'),
        ),
        body: new ListView.builder(
          itemCount: filteredList == null ? 0 : filteredList.length,
          itemBuilder: (BuildContext context, i) {
            return Padding(
              padding:   EdgeInsets.only(top: 4.0.sp, right: 4.0.sp),
              child: Container(
                  height: 30.0.h,

                  child: Center(child: VideoItem('https://hospitality92.com/uploads/videos/'))

              ),
            );

          },
        )
    );
  }

}