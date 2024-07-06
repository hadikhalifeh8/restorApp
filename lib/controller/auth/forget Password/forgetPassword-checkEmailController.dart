import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/class/statusRequest.dart';
import 'package:restaurantapp/core/constant/routes.dart';
import 'package:restaurantapp/core/function/handlingDataController.dart';
import 'package:restaurantapp/data/datasource/remote/auth/Forget%20Password/checkEmail(re-sendOTP)_data.dart';

class ForgetPasswordController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController email;

  checkEmail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading; // 1- loading (badda wa2et)
      update();
      var response =
          await checkEmailData.postdata(email.text); //loading هون خلص

      print("***************##############************* Controler $response ");
      statusRequest = handlingData(
          response); // get data / or stausRquest (success /serverfailure / connection  failed ... /)

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifycode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "Warning ", middleText: "Email  not found");
          statusRequest = StatusRequest
              .failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  // goToVerifyCode() {
  //   Get.offAllNamed(AppRoute.verifycode);
  // }
}
