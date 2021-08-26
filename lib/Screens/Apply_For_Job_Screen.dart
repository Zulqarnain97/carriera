import 'dart:io';
import 'package:carriera/Models/Jobs_Model.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'package:http/http.dart' as http;
import 'package:sweetalert/sweetalert.dart';

import '../constants.dart';
import 'DashBoard.dart';

class ApplyForJobScreen extends StatefulWidget {
  final JobModel jobItem;

  ApplyForJobScreen(this.jobItem);

  @override
  _ApplyForJobScreenState createState() => _ApplyForJobScreenState();
}

class _ApplyForJobScreenState extends State<ApplyForJobScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController experience = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController carrier = TextEditingController();

  Map<String, String> _authData = {
    'carrier ': '',
    'experience': '',
    'salary': ''
  };

  File selectedfile;
  Response response;
  String progress;
  Dio dio = new Dio();

  selectFile() async {
    selectedfile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'mp4'],
      //allowed extension to choose
    );

    setState(() {}); //update the UI so that file name is shown
  }

  int getUserId;
  String getUserName;

  Future fetch() async {
    var pref = await SharedPreferences.getInstance();
    var userID = pref.getInt('userID');
    var userNames = pref.getString('userName');

    getUserId = userID;
    getUserName = userNames;
  }

  bool visible = false;

  loadProgress() {
    if (visible == true) {
      setState(() {
        visible = false;
      });
    } else {
      setState(() {
        visible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    fetch();
    print(getUserId);

    final node = FocusScope.of(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 8.0.h,
          automaticallyImplyLeading: false,
          title: Text(
            "Apply For Job",
            style: TextStyle(color: Colors.white, fontSize: 14.0.sp),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
              size: 20.0.sp,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: formKey,
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 10.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(widget.jobItem.title,
                                  style: TextStyle(
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(widget.jobItem.company + ", Lahore",
                                  style: TextStyle(fontSize: 10.0.sp)),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                    child: Divider(thickness: 1.0.sp, color: Colors.black45)),
                TextFormFieldContainer(
                  TextInputType.name,
                  experience,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your experience';
                    }
                    return null;
                  },
                  (value) {
                    _authData['experience'] = value;
                  },
                  Icons.work,
                  'Experience',
                  () => node.nextFocus(),
                ),
                TextFormFieldContainer(TextInputType.number, salary, (value) {
                  if (value.isEmpty) {
                    return '    Enter your desired salary';
                  }
                  return null;
                }, (value) {
                  _authData['salary'] = value;
                }, Icons.attach_money, 'Salary', () => node.nextFocus()),
                TextFormFieldContainer(TextInputType.name, carrier, (value) {
                  if (value.isEmpty) {
                    return ' Enter your Career level';
                  }
                  return null;
                }, (value) {
                  _authData['carrier '] = value;
                }, Icons.lightbulb_outline, 'Career Level',
                    () => node.nextFocus()),
                SizedBox(height: 2.0.h),
                Container(
                  //width: 95.0.w,
                  child: FlatButton.icon(
                    onPressed: () {
                      selectFile();
                    },
                    icon: Icon(
                      Icons.file_copy_outlined,
                      color: Colors.black,
                      size: 14.0.sp,
                    ),
                    label: Container(
                      margin: EdgeInsets.all(10),
                      //show file name here
                      child: selectedfile == null
                          ? Text(
                              "Upload CV",
                              maxLines: 1,
                              style: TextStyle(fontSize: 10.0.sp),
                            )
                          : Text(
                              basename(selectedfile.path),
                              maxLines: 1,
                              style: TextStyle(fontSize: 10.0.sp),
                            ),
                      //basename is from path package, to get filename from path
                      //check if file is selected, if yes then show file name
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    '',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Center(
                  child: Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(top: 5, bottom: 3),
                          child: CircularProgressIndicator())),
                ),
                Container(
                  height: 40.0.h,
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kDefaultPadding.sp),
                    child: InkWell(
                      child: Center(
                          child: GestureDetector(
                              onTap: () {
                                if (formKey.currentState.validate()) {
                                  print('validated');
                                  loadProgress();
                                  uploadFile(experience.text, salary.text,
                                      carrier.text);
                                  /*applyingForJob(usersID: getUserId.toString(), jobID: widget.jobItem.jobID.toString(), experience: experience.text, salary: salary.text, career: carrier.text, relocate: "1", document: fileName);*/
                                } else {
                                  print("Not Validated");
                                }
                                ;
                              },
                              child: Container(
                                height: 6.0.h,
                                width: 90.0.w,
                                decoration: BoxDecoration(
                                  color: kSecondaryColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15.0.sp)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Apply Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }

  Future uploadFile(
    String experience,
    String salary,
    String carrier,
  ) async {
    String uploadurl = "https://hospitality92.com/api/applyjobP";
    FormData formdata = FormData.fromMap({
      "user_id": getUserId,
      "job_id": widget.jobItem.jobID,
      "experience": experience,
      "salary": salary,
      "career": carrier,
      "relocate": "1",
      "document": await MultipartFile.fromFile(selectedfile.path,
          filename: basename(selectedfile.path)
          //show only filename from path
          ),
    });
    response = await dio.post(
      uploadurl,
      data: formdata,
      onSendProgress: (int sent, int total) {
        String percentage = (sent / total * 100).toStringAsFixed(2);
        setState(() {
          progress = percentage + " % uploaded";
          //update the progress
        });
      },
    );
    loadProgress();
    var res = response.toString();
    print("you are getting following response = " + res);
    var resp = res.substring(1, res.length - 1);
    final split = resp.split(',');
    final Map<int, String> values = {
      for (int i = 0; i < split.length; i++) i: split[i]
    };
    final value1 = values[0];
    print("dcdsccccccccccd" + value1.toString());

    if (value1 == '"status":"300"') {
      SweetAlert.show(this.context,
          title: "Sorry $getUserName",
          subtitle: "You have already applied for this Job!!",
          style: SweetAlertStyle.error);
    } else {
      SweetAlert.show(this.context,
          title: "Dear $getUserName",
          subtitle: "Your Job application has been sent!",
          style: SweetAlertStyle.success, onPress: (bool isConfirmed) {
        if (isConfirmed)
          Navigator.of(this.context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => DashBoard()));
        Navigator.pop(this.context);

        // return false;
      });
    }

    print(response.toString());
    // if(response!.statusCode == 200){
    //
    //
    //
    //   //print response from server
    // }else{
    //   Fluttertoast.showToast(msg: "Something went wrong! Try again Later", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 10, backgroundColor: Colors.black54, textColor: Colors.white, fontSize: 16.0);
    //
    //   print("Error during connection to server.");
    // }
  }
}

Widget TextFormFieldContainer(
  TextInputType type,
  TextEditingController controller,
  FormFieldValidator validator,
  Function onSave,
  IconData icon,
  String hint,
  Function moveFocus,
) {
  return Container(
    height: 7.0.h,
    margin: EdgeInsets.only(top: kDefaultPadding.sp / 2),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.all(Radius.circular(8.0.sp)),
      color: Colors.white,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding.sp / 2, vertical: kDefaultPadding.sp / 3),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          keyboardType: type,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '    This Field Cannot Be Empty';
            }
            return null;
          },
          //onSaved: onSave,
          style: TextStyle(
            fontSize: 12.0.sp,
          ),
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 6.0.sp, color: Colors.red),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 10.0.sp),
            prefixIcon: Icon(
              icon,
              size: 18.0.sp,
            ),
          ),
          // onEditingComplete: moveFocus,
        ),
      ),
    ),
  );
}
