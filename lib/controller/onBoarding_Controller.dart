import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/constant/routes.dart';
import 'package:restaurantapp/core/services/services.dart';

import 'package:restaurantapp/data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  //رقم الصفحه
  int currentPage = 0;

  MyServices myservices = Get.find();

  @override
  next() {
    currentPage++;
    //OnBoarding Pages معش في داعي يرجع لل  login  بس يصير بال
    // bs yseer b2a5er saf7a men l onbarding badoo yroo7 3ala login page
    if (currentPage > onBoardingList.length - 1) {
      myservices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
      print("last page");
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  // أول ما تفتح الصفحه
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
