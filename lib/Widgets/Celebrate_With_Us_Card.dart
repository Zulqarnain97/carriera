import 'package:flutter/material.dart';
import 'package:carriera/Models/Celebrate_With_Us.dart';
import 'package:sizer/sizer.dart';
import '../constants.dart';

class CelebrateWithUsCard extends StatelessWidget{
  final CelebrateWithUsItem celebrateWithUs;

  const CelebrateWithUsCard({  this.celebrateWithUs}) ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: kDefaultPadding.sp/2 , top: kDefaultPadding.sp / 5, bottom: kDefaultPadding.sp / 5),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(kBorderRadius.sp/2),
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius.sp/2),

          ),


          width: 30.0.w,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(kBorderRadius.sp/2)
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderRadius.sp/2),
                      child:
                      Image.network(celebrateWithUs.imagePath, fit: BoxFit.cover, width: double.infinity,  )),


                ),
              ),
              Container(height: 3.0.h,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(kBorderRadius.sp/2),
                ),
                child: Center(child: Text(celebrateWithUs.name,
                  style: TextStyle(
                      fontSize: 8.0.sp,
                      fontWeight: FontWeight.w400
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,)),
              ),
            ],
          ),
        ),
      ),
    );
  }

}