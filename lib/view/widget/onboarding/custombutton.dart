import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/onBoarding_Controller.dart';
import 'package:restaurantapp/core/constant/color.dart';

class custombutton extends GetView<OnBoardingControllerImp> {
  const custombutton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.primaryColor,
      onPressed: () {},
      child: IconButton(
          color: AppColor.white,
          onPressed: () {
            controller.next();
          },
          icon: const Icon(Icons.arrow_forward)),
    );
  }
}
