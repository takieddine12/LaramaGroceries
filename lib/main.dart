import 'package:firebase_core/firebase_core.dart';
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
   await Firebase.initializeApp(
     options: FirebaseOptions(
         apiKey: "AIzaSyBRa_GsiPQbxN6_iy9M25gDP1Bndoy9U4o",
         appId: "1:166941805808:android:a5112c429646783ec48635",
         messagingSenderId: "166941805808",
         projectId: "groceriesflutter")
   );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
