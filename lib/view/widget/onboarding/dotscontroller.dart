import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/onBoarding_Controller.dart';
import 'package:restaurantapp/core/constant/color.dart';
import 'package:restaurantapp/data/datasource/static/static.dart';

class dotscontroller extends StatelessWidget {
  const dotscontroller({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.all(5.0),
                          duration: Duration(milliseconds: 900),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: controller.currentPage == index
                                ? AppColor.primaryColor
                                : AppColor.grey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        )),
              ],
            ));
  }
}
