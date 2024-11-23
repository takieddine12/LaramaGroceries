import 'package:flutter/material.dart';
import 'package:groceries/extras/utils.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final Function() onClick;
  const CustomContainer({super.key, required this.text , required this.onClick});

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
          child: Text(text,style: Utils.getBoldFont().copyWith(color: Colors.white),),
        ),
      ),
    );
  }
}
