import 'package:cached_network_image/cached_network_image.dart';
import 'package:carriera/Models/Jobs_Model.dart';
import 'package:carriera/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import 'Apply_For_Job_Screen.dart';


class JobsDetail extends StatelessWidget {
  final JobModel jobItem;

  JobsDetail(this.jobItem);

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
                      'Job Details',
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
              padding: const EdgeInsets.all(32),
              alignment: Alignment.topCenter,
              width: 100.0.w,
              height: 22.0.h,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff5a7181), Color(0xff5e6172)])),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Center(
                      child: Container(
                          height: 5.0.h,
                          //color: Colors.red,
                          child: Text(jobItem.title, style: TextStyle(fontSize: 16.0.sp, color: Colors.white))),
                    ),
                  ),
                  Container(
                    height: 3.0.h,
                    width: 15.0.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green, Colors.green],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Center(
                        child: Text(
                          jobItem.type,
                          style: TextStyle(fontSize: 8.0.sp, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        height: 10.0.h,
                        width: 15.0.w,
                        imageUrl: 'https://hospitality92.com/uploads/job/${jobItem.jobImage}',
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
                        ),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, left: 8.0),
                        child: Text("Office Name: " + jobItem.company,style: TextStyle(fontSize: 10.0.sp),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text("Location: " + "Lahore",style: TextStyle(fontSize: 10.0.sp),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(8, 16, 0, 0),
                            child: Text(
                              "JOB DETAILS",
                              style: TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                            ),
                            alignment: Alignment.topLeft),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.date_range_sharp, color: Colors.lightBlue),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          "Date Posted:",
                                          style: TextStyle(fontSize: 11.0.sp, fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    jobItem.date,
                                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.0.sp, color: Colors.black54),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.list,
                                    color: Colors.lightBlue,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          "Job Category:",
                                          style: TextStyle(fontSize: 11.0.sp, fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    jobItem.category,
                                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.0.sp, color: Colors.black54),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.book,
                                    color: Colors.lightBlue,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          "Job Skills:",
                                          style: TextStyle(fontSize: 11.0.sp, fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    jobItem.skills,
                                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.0.sp, color: Colors.black54),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  new FaIcon(
                                    FontAwesomeIcons.graduationCap,
                                    color: Colors.lightBlue,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          "Career Level:",
                                          style: TextStyle(fontSize: 11.0.sp, fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    jobItem.career_level,
                                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.0.sp, color: Colors.black54),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.lightBlue,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          "Job Location:",
                                          style: TextStyle(fontSize: 11.0.sp, fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Location",
                                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.0.sp, color: Colors.black54),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  new FaIcon(
                                    FontAwesomeIcons.handHoldingUsd,
                                    color: Colors.lightBlue,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          "Salary:",
                                          style: TextStyle(fontSize: 11.0.sp, fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Rs. " + jobItem.min_salary + " - " + "Rs." + jobItem.max_salary,
                                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.0.sp, color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  new FaIcon(
                                    FontAwesomeIcons.graduationCap,
                                    color: Colors.lightBlue,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          "Qualification:",
                                          style: TextStyle(fontSize: 11.0.sp, fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    jobItem.qualification,
                                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.0.sp, color: Colors.black54),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.brightness_auto_sharp,
                                    color: Colors.lightBlue,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          "Experience:",
                                          style: TextStyle(fontSize: 11.0.sp, fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    jobItem.min_experience + " - " + jobItem.max_experience + " years",
                                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10.0.sp, color: Colors.black54),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  new FaIcon(
                                    FontAwesomeIcons.venusMars,
                                    color: Colors.lightBlue,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          "Preference:",
                                          style: TextStyle(fontSize: 11.0.sp, fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    jobItem.preference,
                                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.0.sp,color: Colors.black54),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: kDefaultPadding.sp/2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kBorderRadius),
                            ),
                            child: RaisedButton(
                              onPressed: () {
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ApplyForJobScreen(jobItem)),
                                );
                              },
                              color: Colors.lightBlue,
                              child: Padding(
                                padding: EdgeInsets.all(kDefaultPadding.sp/4),
                                child: Text(
                                  "Apply For JOB",
                                  style: TextStyle(color: Colors.white, fontSize: 12.0.sp),
                                ),
                              ),
                            )),
                      ],
                    ),
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