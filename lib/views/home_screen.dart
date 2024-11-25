import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/extras/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.toNamed(Routes.add);
          },
          child: Icon(Icons.add,size: 25,color: Colors.white,),
        ),
        body: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
