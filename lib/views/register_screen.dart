import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:groceries/bloc/bloc_event.dart';
import 'package:groceries/bloc/bloc_state.dart';
import 'package:groceries/extras/routes.dart';

import '../bloc/auth_bloc.dart';
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
  bool isLoading = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc,BlocState>(
      listener: (context,state){

        if(state is RegisterUserState){
           UserCredential? userCredential = state.userCredential;
           if(userCredential?.user != null){

             // UPLOAD DATA
             BlocProvider.of<AuthBloc>(context).add(CreateUserAccountEvent(
                 _fullNameController.text,
                 _emailController.text,
                 _phoneController.text,
                 _addressController.text));

             Get.offAndToNamed(Routes.home);

           }
           else{

             Get.showSnackbar(GetSnackBar(
               title: "Register",
               message: "Register Failed",
               duration: Duration(seconds: 2),
             ));

           }
        }
        else if (state is CreateUserAccountState){
          bool isSuccess = state.result;
          if(isSuccess){

            setState(() {
              isLoading = false;
            });

            Get.showSnackbar(GetSnackBar(
              title: "Register",
              message: "Register Success",
              duration: Duration(seconds: 2),
            ));

            Get.offAndToNamed(Routes.home);

          } else {

            setState(() {
              isLoading = false;
            });

            Get.showSnackbar(GetSnackBar(
              title: "Register",
              message: "Register Failed",
              duration: Duration(seconds: 2),
            ));

            // delete account
            BlocProvider.of<AuthBloc>(context).add(DeleteUserAccountEvent());
          }
        }
        else if (state is DeleteUserAccountState){
          var isDeleted = state.isDeleted;
          if(isDeleted){
            print("User Account Deleted");
          }
        }

      },
      child: SafeArea(
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

                      var emailAddress = _emailController.text;
                      var password = _passController.text;

                      if(emailAddress.isEmpty){
                        Get.showSnackbar(GetSnackBar(
                          title: "Email",
                          message: "Email cannot be empty",
                          duration: Duration(seconds: 2),
                        ));
                        return;
                      }
                      if(password.isEmpty){
                        Get.showSnackbar(GetSnackBar(
                          title: "Password",
                          message: "Password cannot be empty",
                          duration: Duration(seconds: 2),
                        ));
                        return;
                      }
                      if(password.length < 6){
                        Get.showSnackbar(GetSnackBar(
                          title: "Password Length",
                          message: "Password length cannot be less than 6",
                          duration: Duration(seconds: 2),
                        ));
                        return;
                      }


                      BlocProvider.of<AuthBloc>(context).add(LoginUserEvent(emailAddress, password));

                    }, isLoading: isLoading,)),
                    const SizedBox(height: 30,),
                    Center(child: Text("Have an account? Login",style: Utils.getMediumFont()
                        .copyWith(fontSize: 18),))
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
