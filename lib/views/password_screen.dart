import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:groceries/bloc/auth_bloc.dart';
import 'package:groceries/bloc/bloc_event.dart';
import 'package:groceries/bloc/bloc_state.dart';

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
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context,state){
        if(state is ResetUserPasswordState){
          var isSent = state.result;
          if(isSent){

            setState(() {
              isLoading = false;
            });

            Get.showSnackbar(GetSnackBar(
              title: "Reset Password",
              message: "Reset email has been sent.",
              duration: Duration(seconds: 2),
            ));

          } else {

            setState(() {
              isLoading = false;
            });

            Get.showSnackbar(GetSnackBar(
              title: "Reset Password",
              message: "Failed to send a reset email",
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
                      Text("Reset Password",style: Utils.getMediumFont().copyWith(fontSize: 25),),
                      const SizedBox(height: 40,),
                      Text("Email",style: Utils.getMediumFont().copyWith(fontSize: 17),),
                      const SizedBox(height: 5,),
                      CustomEditText(hint: "Email Address", textEditingController: _emailController, isPassword: false,
                          onTap: null, iconData: Icons.email),
                      const SizedBox(height: 30,),
                      Center(child: CustomContainer(text: "Reset", onClick: (){

                        var emailAddress = _emailController.text;

                        if(emailAddress.isEmpty){
                          Get.showSnackbar(GetSnackBar(
                            title: "Email",
                            message: "Email cannot be empty.",
                            duration: Duration(seconds: 2),
                          ));

                          return;
                        }

                        setState(() {
                          isLoading = true;
                        });

                        BlocProvider.of<AuthBloc>(context).add(ResetUserPasswordEvent(emailAddress));

                      }, isLoading: isLoading,)),
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
