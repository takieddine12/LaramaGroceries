import 'package:flutter/material.dart';
import 'package:groceries/extras/utils.dart';

class GroceryEditText extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  const GroceryEditText({super.key , required this.hint , required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: Utils.getMediumFont(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        hintText: hint,
        hintStyle: Utils.getMediumFont()
      ),
    );
  }
}
