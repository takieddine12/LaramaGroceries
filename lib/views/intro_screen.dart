import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/components/custom_container.dart';
import 'package:groceries/extras/routes.dart';
import 'package:groceries/extras/utils.dart';
import 'package:groceries/storage/storage_helper.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  bool shouldShownBtn = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 30,),
            Expanded(
              flex: 4,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int index){
                  setState(() {
                    currentIndex = index;
                    if(currentIndex == 2){
                        shouldShownBtn = true;
                    } else {
                        shouldShownBtn = false;
                    }
                  });
                },
                children: List.generate(Utils.titles.length, (int index){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Utils.titles[index],style: Utils.getMediumFont().copyWith(fontSize: 25),),
                      Image.asset(Utils.images[index]),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(Utils.descriptions[index],
                          style: Utils.getBoldFont().copyWith(fontSize: 20),
                          textAlign: TextAlign.center,),
                      )
                    ],
                  );
                }),
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (int index){
                      return Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: currentIndex == index ? 15 : 10,
                        width: currentIndex == index ? 15 : 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndex == index ? Colors.black87 : Colors.black12
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20,),
                  Visibility(
                    visible: shouldShownBtn,
                    child: CustomContainer(text: "Get Started", onClick: (){
                      StorageHelper.setIsShown();
                      Get.offAndToNamed(Routes.login);
                    }, isLoading: false,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
