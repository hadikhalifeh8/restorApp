import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/onBoarding_Controller.dart';
import 'package:restaurantapp/core/constant/color.dart';
import 'package:restaurantapp/data/datasource/static/static.dart';
import 'package:restaurantapp/view/widget/onboarding/custombutton.dart';
import 'package:restaurantapp/view/widget/onboarding/customslider.dart';
import 'package:restaurantapp/view/widget/onboarding/dotscontroller.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(
                flex: 3,
                child: customslider(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 100.0, right: 20.0, left: 20.0),
                  child: const Row(
                    children: [
                      dotscontroller(),
                      Spacer(),
                      custombutton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
