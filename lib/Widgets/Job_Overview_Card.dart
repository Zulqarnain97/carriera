import 'package:flutter/material.dart';


import 'package:sizer/sizer.dart';



class JobOverviewCard extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return   GestureDetector(
      onTap: null,
      child: Padding(
        padding: EdgeInsets.only(

          left: 10.0.sp ,right: 10.0.sp, bottom: 10.0.sp, ),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10.0.sp),
          child: Container(

            height: 17.0.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0.sp),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 4.0.h,

                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Senior Developer',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0.sp,

                              fontWeight: FontWeight.bold),
                        ),
                      )
                  ),
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
                          width: 10.0.sp,
                        ),
                        Text(
                          '20,000-50,000',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0.sp,

                              fontWeight: FontWeight.w600),
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
                            Icons.location_on,
                            color: Colors.grey,
                            size: 12.0.sp,
                          ),
                          SizedBox(
                            width: 10.0.sp,
                          ),
                          Text(
                            'Islamabad, Pakistan',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0.sp,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Container(
                            width: 18.0.w,
                            height: 3.0.h,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6.0.sp)
                            ),
                            child: Center(
                              child: Text(
                                'Full-time',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0.sp,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                  Center(
                      child: Container(
                        color: Colors.grey.withOpacity(0.3),
                        height: 1.0.sp,
                        width: 80.0.w,
                      )),
                  Container(
                    height: 3.0.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.work,
                          color: Colors.grey,
                          size: 12.0.sp,
                        ),
                        SizedBox(
                          width: 10.0.sp,
                        ),
                        Text(
                          '8-10 years',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0.sp,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                          'Sozie',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 10.0.sp,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}