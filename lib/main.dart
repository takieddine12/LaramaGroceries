import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:groceries/extras/routes.dart';
import 'package:groceries/views/splash_screen.dart';

void main() async {
  await _initialize();
  runApp(GetMaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    getPages: Routes.pages,
  ));
}

_initialize() async {
   GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
