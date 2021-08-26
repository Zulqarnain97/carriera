import 'package:carriera/Models/Restaurents.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants.dart';

class RestaurentCard extends StatelessWidget{

  final Restaurents restaurents;

  const RestaurentCard({Key key, this.restaurents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      height: 20.0.h,
    );
  }

}