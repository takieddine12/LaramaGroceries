import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:groceries/extras/utils.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final Function() onClick;
  final bool isLoading;
  const CustomContainer({super.key, required this.text , required this.onClick,
  required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue
        ),
        child: Center(
          child: isLoading ?
          SizedBox(
            height: 20,
            width: 20,
            child: SpinKitDoubleBounce(size: 25,color: Colors.deepOrange,),
          ) :
          Text(text,style: Utils.getBoldFont().copyWith(color: Colors.white),),
        ),
      ),
    );
  }
}
