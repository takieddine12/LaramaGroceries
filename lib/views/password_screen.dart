import 'package:flutter/material.dart';

import '../components/custom_container.dart';
import '../components/custom_edit_text.dart';
import '../extras/utils.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {

  final TextEditingController _emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset("assets/images/supermarket.png",width: 250,height: 250,filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reset Password",style: Utils.getMediumFont().copyWith(fontSize: 25),),
                    const SizedBox(height: 40,),
                    Text("Email",style: Utils.getMediumFont().copyWith(fontSize: 17),),
                    const SizedBox(height: 5,),
                    CustomEditText(hint: "Email Address", textEditingController: _emailController, isPassword: false,
                        onTap: null, iconData: Icons.email),
                    const SizedBox(height: 30,),
                    Center(child: CustomContainer(text: "Reset", onClick: (){})),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
