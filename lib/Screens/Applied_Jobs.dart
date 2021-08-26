import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carriera/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({Key key}) : super(key: key);

  @override
  _AppliedJobsState createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {

  int getUserId;
  String getJobStatus;
  String getJobsLength = "0";
  Future<List<dynamic>> getUserAppliedData() async {
    var pref = await SharedPreferences.getInstance();
    var userID = pref.getInt('userID');
    print(userID);
    getUserId = userID;
    String url = 'https://hospitality92.com/api/getappliedjobs/$userID';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    return json.decode(response.body)['jobs'];
  }

  @override
  Widget build(BuildContext context) {
    getUserAppliedData();
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
                      'Applied Jobs',
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
              color: Colors.transparent,
              height: 80.0.h,
              child: Padding(
                padding:   EdgeInsets.all(8.0.sp),
                child:  FutureBuilder<List<dynamic>>(
                  future: getUserAppliedData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0.sp, top: 8.0.sp, right: 8.0.sp, bottom: 8.0.sp),
                            child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "You have applied for ${snapshot.data.length} jobs",
                                  style: TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.w500),
                                )),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding.sp / 2, vertical: kDefaultPadding.sp / 5),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                var jobsLength = snapshot.data?.length;
                                getJobsLength = jobsLength.toString();
                                var job = snapshot.data[index]['job'];
                                var title = job['title'];
                                var companyName = job['company_name'];
                                var minSalary = job['min_salary'];
                                var maxSalary = job['max_salary'];
                                var jobStatus = snapshot.data[index]['status'];
                                if(jobStatus == "1"){
                                  getJobStatus = "Pending";
                                }else{
                                  getJobStatus = "Completed";
                                }

                                return GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.only(left: kDefaultPadding.sp / 2, right: kDefaultPadding.sp / 2, bottom: kDefaultPadding.sp / 2),
                                    child: Material(
                                      elevation: 2,
                                      borderRadius: BorderRadius.circular(kBorderRadius.sp / 2),
                                      child: Container(
                                        height: 11.0.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(kBorderRadius.sp / 2),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: kBorderRadius.sp / 2),
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
                                                      style: TextStyle(color: Colors.black87, fontSize: 12.0.sp, fontWeight: FontWeight.w600),
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
                                                      width: kDefaultPadding.sp / 2,
                                                    ),
                                                    Text(
                                                      "Rs. " + minSalary + "-" + maxSalary,
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
                                                        width: kDefaultPadding.sp / 2,
                                                      ),
                                                      Text(
                                                        /*'Islamabad, Pakistan'*/
                                                        companyName,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(color: Colors.grey, fontSize: 10.0.sp, fontFamily: 'Mulish', fontWeight: FontWeight.w600),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        width: 18.0.w,
                                                        height: 3.0.h,
                                                        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(kBorderRadius.sp / 2)),
                                                        child: Center(
                                                          child: Text(
                                                            getJobStatus,
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
                          ),
                        ],

                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}