import 'package:carriera/Models/Restaurents.dart';
import 'package:carriera/Widgets/Restaurent_Card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:carriera/constants.dart';

class RestaurentsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         color: Colors.white,
        height: 78.0.h,
        width: 100.0.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
             RestaurentBox('Prima Castle',
            'https://images.unsplash.com/photo-1559910369-3924e235c1cf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdHVyZW50c3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
              RestaurentBox(
                   'Arabian Chef',
                   'https://images.unsplash.com/photo-1537047902294-62a40c20a6ae?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
              ),
              RestaurentBox(
                   'Laal Qilla',
                   'https://images.unsplash.com/photo-1559329007-40df8a9345d8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
              ),
              RestaurentBox(
                  'Chaar Meenar',
                   'https://images.unsplash.com/photo-1574936145840-28808d77a0b6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
              ),
              SizedBox(height: 10.0.sp,),
            ],
          ),
        )
      ),
    );
  }
  Widget RestaurentBox(String name, String image){
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding.sp),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.all(Radius.circular(kBorderRadius.sp)),
        child: Container(

         decoration: BoxDecoration(

           borderRadius: BorderRadius.all(Radius.circular(kBorderRadius.sp)),
         ),
          height: 20.0.h,
          width: 80.0.w,
          child: Column(
            children: [
              Flexible(
                  flex: 4,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(kBorderRadius.sp)),
                      child: Image.network(image, fit: BoxFit.cover, width: double.infinity,))),
              Flexible(
                  flex: 1,
                  child: Center(child: Text(name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.0.sp,
                    color: Colors.black54
                  ),
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
