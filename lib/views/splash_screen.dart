import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/extras/routes.dart';
import 'package:groceries/storage/storage_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5),(){
       if(StorageHelper.isShown()){
         Get.offAndToNamed(Routes.login);
       } else {
         Get.offAndToNamed(Routes.intro);
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/images/supermarket.png",width: 250,height: 250,
          fit: BoxFit.cover,filterQuality: FilterQuality.high),
        ),
      ),
    );
  }
}
