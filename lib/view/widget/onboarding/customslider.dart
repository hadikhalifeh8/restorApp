import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/onBoarding_Controller.dart';
import 'package:restaurantapp/data/datasource/static/static.dart';

class customslider extends GetView<OnBoardingControllerImp> {
  const customslider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          print(val);
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                const SizedBox(height: 70.0),
                Image.asset(onBoardingList[i].image!),
                const SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(right: 43),
                  child: Text(
                    onBoardingList[i].title!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.5,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(onBoardingList[i].body!),
              ],
            ));
  }
}
