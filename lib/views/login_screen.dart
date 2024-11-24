import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:groceries/bloc/auth_bloc.dart';
import 'package:groceries/bloc/bloc_event.dart';
import 'package:groceries/components/custom_container.dart';
import 'package:groceries/components/custom_edit_text.dart';
import 'package:groceries/extras/routes.dart';
import 'package:groceries/extras/utils.dart';

import '../bloc/bloc_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context,state){

        if(state is LoginUserState){
          UserCredential? userCredential = state.userCredential;
          if(userCredential?.user != null){

            setState(() {
              isLoading = false;
            });

            Get.showSnackbar(GetSnackBar(
              title: "Login",
              message: "Login Success",
              duration: Duration(seconds: 2),
            ));

            Get.offAndToNamed(Routes.home);

          } else{

            setState(() {
              isLoading = false;
            });

            Get.showSnackbar(GetSnackBar(
              title: "Login",
              message: "Login Failed",
              duration: Duration(seconds: 2),
            ));

          }
        }

      },
      child: SafeArea(
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
                      Center(child: CustomContainer(text: "Login", onClick: (){

                        var emailAddress = _emailController.text;
                        var password = _passController.text;

                        if(emailAddress.isEmpty){
                          return;
                        }
                        if(password.isEmpty){
                          return;
                        }

                        setState(() {
                          isLoading = true;
                        });


                        BlocProvider.of<AuthBloc>(context).add(LoginUserEvent(emailAddress, password));

                      }, isLoading: isLoading,)),
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
      ),
    );
  }
}
