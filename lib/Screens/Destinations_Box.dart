import 'dart:convert';

import 'package:carriera/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:carriera/constants.dart';

class DestinationsBox extends StatefulWidget {
  const DestinationsBox({Key  key}) : super(key: key);

  @override
  _DestinationsBoxState createState() => _DestinationsBoxState();
}

class _DestinationsBoxState extends State<DestinationsBox> {
  List<String> citiesList = [];



  Future<List<dynamic>> getCityData() async {
    String url = 'https://hospitality92.com/api/getcities';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    return json.decode(response.body)['jobs'];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.all(kDefaultPadding.sp/2),
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(40),
            child: Container(
              //padding: EdgeInsets.all(8.0.sp),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(kBorderRadius.sp), color: Colors.white),
                height: 6.0.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    destinationType('Historical', FontAwesomeIcons.monument, Colors.red),
                    destinationType('Cultural', FontAwesomeIcons.peopleArrows, Colors.green),
                    destinationType('Religious', FontAwesomeIcons.mosque, Colors.blue),
                    destinationType('Recreational', FontAwesomeIcons.umbrellaBeach, Colors.orange),
                    destinationType('Others', FontAwesomeIcons.map, Colors.blue),
                  ],
                )),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 8.0.sp, right: 8.0.sp),
          child: Material(
            elevation: 4.0,
            child: Container(
              height: 65.0.h,
              color: Color(0x12000000),
              child: SingleChildScrollView(child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0.sp, 12.0.sp, 8.0.sp, 4.0.sp),
                    child: Container(width: double.infinity,child: Text("Select Destinations",textAlign: TextAlign.start ,style: TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.bold),)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      destinations('attock', FontAwesomeIcons.mosque, Colors.greenAccent),
                      destinations('bahawalnagar', FontAwesomeIcons.placeOfWorship, Colors.greenAccent),
                      destinations('bahawalpur', FontAwesomeIcons.ankh, Colors.greenAccent),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      destinations('bhakkar', FontAwesomeIcons.khanda, Colors.orangeAccent),
                      destinations('chakwal', FontAwesomeIcons.synagogue, Colors.orangeAccent),
                      destinations('chiniot', FontAwesomeIcons.dove, Colors.orangeAccent),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      destinations('bhakkar', FontAwesomeIcons.mosque, Colors.pinkAccent),
                      destinations('chakwal', FontAwesomeIcons.synagogue, Colors.pinkAccent),
                      destinations('chiniot', FontAwesomeIcons.placeOfWorship, Colors.pinkAccent),

                    ],
                  ),
                ],
              )),
              //color: Colors.red,


            ),
          ),
        ),


      ],
    );
  }

  Widget destinationType(String title, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.only(left: 8.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: color,
            size: 12.0.sp,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 8.0.sp),
          )
        ],
      ),
    );
  }
  Widget destinations(String cityName, IconData icon, Color color){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0.sp, 0.0.sp, 2.0.sp, 4.0.sp),
      child: Container(
        height: 12.0.h,
        width: 29.0.w,
        color: color.withOpacity(0.2.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              icon, size: 20.0.sp,
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 8.0.sp),
              child: Text(cityName, style: TextStyle(fontSize: 10.0.sp),),
            )
          ],
        ),
      ),
    );
  }
}
