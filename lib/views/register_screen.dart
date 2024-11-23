import 'package:flutter/material.dart';

import '../components/custom_container.dart';
import '../components/custom_edit_text.dart';
import '../extras/utils.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("assets/images/supermarket.png",width: 250,height: 250,filterQuality: FilterQuality.high,
                fit: BoxFit.cover,),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Register",style: Utils.getMediumFont().copyWith(fontSize: 25),),
                  const SizedBox(height: 40,),
                  CustomEditText(hint: "Full Name", textEditingController: _fullNameController, isPassword: false,
                      onTap: null, iconData: Icons.person),
                  const SizedBox(height: 10,),
                  CustomEditText(hint: "Phone Number", textEditingController: _phoneController, isPassword: false,
                      onTap: null, iconData: Icons.phone),
                  const SizedBox(height: 10,),
                  CustomEditText(hint: "Email Address", textEditingController: _emailController, isPassword: false,
                      onTap: null, iconData: Icons.email),
                  const SizedBox(height: 10,),
                  CustomEditText(hint: "Full Address", textEditingController: _addressController, isPassword: false,
                      onTap: null, iconData: Icons.email),
                  const SizedBox(height: 10,),
                  CustomEditText(hint: "Password", textEditingController: _passController, isPassword: true,
                      onTap: (){}, iconData: Icons.password),
                  const SizedBox(height: 10,),
                  CustomEditText(hint: "Confirm Password", textEditingController: _confirmPasswordController, isPassword: true,
                      onTap: null, iconData: Icons.password),
                  const SizedBox(height: 40,),
                  Center(child: CustomContainer(text: "Register", onClick: (){

                  })),
                  const SizedBox(height: 30,),
                  Center(child: Text("Have an account? Login",style: Utils.getMediumFont()
                      .copyWith(fontSize: 18),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
