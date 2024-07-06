import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/class/statusRequest.dart';
import 'package:restaurantapp/core/constant/routes.dart';
import 'package:restaurantapp/core/function/handlingDataController.dart';
import 'package:restaurantapp/data/datasource/remote/auth/Forget%20Password/verifycode_data.dart';

class VerifyCodeController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  VerifyCodeResetPasswordData verifyCodeResetPasswordData =
      VerifyCodeResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  String? email; //forgetpasswordController ببعتو من صفحة ال

  goToResetPasswordPage(verifycode) async {
    statusRequest = StatusRequest.loading; // 1- loading (badda wa2et)
    update();

    var response = await verifyCodeResetPasswordData.postdata(
        email!, verifycode); //loading هون خلص

    print("***************##############************* Controler $response ");
    statusRequest = handlingData(
        response); // get data / or stausRquest (success /serverfailure / connection  failed ... /)

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetpassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Warning ", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"]; // CheckEmail Page من ال  email بستقبل
    super.onInit();
  }

  // goToRessetPassword() {
  //   Get.offAllNamed(AppRoute.resetpassword);
  // }
}
