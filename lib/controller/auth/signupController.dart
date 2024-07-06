import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/class/statusRequest.dart';
import 'package:restaurantapp/core/constant/routes.dart';
import 'package:restaurantapp/core/function/handlingDataController.dart';
import 'package:restaurantapp/data/datasource/remote/auth/signup_data.dart';

class SignUpcontroller extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phoneno;
  late TextEditingController password;

  SignupData signupData = SignupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  bool isPasswordShow = true; // بالبدايه لازم يظهر الكتابه
  showPassword() {
    isPasswordShow = isPasswordShow == true ? false : true;
    update();
  }

  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading; // 1- loading (badda wa2et)
      update();
      var response = await signupData.postdata(username.text, email.text,
          phoneno.text, password.text); //loading هون خلص

      print("***************##############************* Controler $response ");
      statusRequest = handlingData(
          response); // get data / or stausRquest (success /serverfailure / connection  failed ... /)

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']); // add بحط بس  register(api)بألب ال token عشان حاطط
          //data.add(response['data']);
          Get.offNamed(AppRoute.verifycodesignup, arguments: {
            "email": email.text
          }); //verifycode لصفحة ال  email ببعت ال
        } else {
          Get.defaultDialog(
              title: "Warning ", middleText: " email @ alrady exists");
          statusRequest = StatusRequest
              .failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
        }
      }
      update();

      //Get.offNamed(AppRoute.verifycodesignup,  arguments:{"email": email.text} ); //verifycode لصفحة ال  email ببعت ال
    } else {
      // Get.defaultDialog(title: "Warning ", middleText: "ph / ema @ alrady exists");
      //  statusRequest = StatusRequest.failure;
    }
  }

  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phoneno = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phoneno.dispose();
    password.dispose();
    super.dispose();
  }
}
