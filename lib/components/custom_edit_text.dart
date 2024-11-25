import 'package:flutter/material.dart';
import 'package:groceries/extras/utils.dart';

class CustomEditText extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final bool isPassword;
  final Function()? onTap;
  final IconData iconData;
  const CustomEditText({super.key,required this.hint, required this.textEditingController ,
  required this.isPassword , required this.onTap , required this.iconData});

  @override
  State<CustomEditText> createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  var icon = Icons.remove_red_eye;
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      obscureText: widget.isPassword ? isObsecure : false,
      style: Utils.getMediumFont(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        hintText: widget.hint,
        hintStyle: Utils.getMediumFont(),
        prefixIcon: Icon(widget.iconData),
        suffixIcon: widget.isPassword ? IconButton(
            onPressed: (){
              setState(() {
                isObsecure = !isObsecure;
                isObsecure ? icon = Icons.remove_red_eye : icon = Icons.remove_red_eye_outlined;
              });
            },
            icon: Icon(icon,size: 25)) : SizedBox(width: 15,height: 15,)
      ),
    );
  }
}
