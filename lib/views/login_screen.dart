import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/components/custom_container.dart';
import 'package:groceries/components/custom_edit_text.dart';
import 'package:groceries/extras/routes.dart';
import 'package:groceries/extras/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

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
                    Text("Login",style: Utils.getMediumFont().copyWith(fontSize: 25),),
                    const SizedBox(height: 40,),
                    Text("Email",style: Utils.getMediumFont().copyWith(fontSize: 17),),
                    const SizedBox(height: 5,),
                    CustomEditText(hint: "Email Address", textEditingController: _emailController, isPassword: false,
                        onTap: null, iconData: Icons.email),
                    const SizedBox(height: 20,),
                    Text("Password",style: Utils.getMediumFont().copyWith(fontSize: 17),),
                    const SizedBox(height: 5,),
                    CustomEditText(hint: "Password", textEditingController: _passController, isPassword: true,
                        onTap: (){}, iconData: Icons.password),
                    const SizedBox(height: 50,),
                    Center(child: GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.password);
                      },
                      child: Text("Forgot Password",style: Utils.getMediumFont().copyWith(fontSize: 18),),
                    )),
                    const SizedBox(height: 30,),
                    Center(child: CustomContainer(text: "Login", onClick: (){})),
                    const SizedBox(height: 30,),
                    Center(child: GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.register);
                      },
                      child: Text("You don't have account? Register",style: Utils.getMediumFont()
                          .copyWith(fontSize: 18),),
                    ))
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
