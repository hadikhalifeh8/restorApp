import 'package:get/get.dart';
import 'package:restaurantapp/core/class/statusRequest.dart';
import 'package:restaurantapp/core/constant/routes.dart';
import 'package:restaurantapp/core/function/handlingDataController.dart';
import 'package:restaurantapp/core/services/services.dart';
import 'package:restaurantapp/data/datasource/remote/verifycode_signup_data.dart';


class VerifyCodeSignUpController extends GetxController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());


  MyServices myservices = Get.find();

//  late String verifycode;
  String? email; //signupController ببعتو من صفحة ال
  StatusRequest statusRequest = StatusRequest.none;

  goTohomepage(verifycode) async {
    statusRequest = StatusRequest.loading; // 1- loading (badda wa2et)
    update();

    var response = await verifyCodeSignUpData.postdata(
        email!, verifycode); //loading هون خلص

    print("***************##############************* Controler $response ");
    statusRequest = handlingData(
        response); // get data / or stausRquest (success /serverfailure / connection  failed ... /)

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

          myservices.sharedPreferences
                .setString("id", response['data']['id'].toString());
            myservices.sharedPreferences
                .setString("name", response['data']['name'].toString());
            myservices.sharedPreferences
                .setString("email", response['data']['email'].toString());
            myservices.sharedPreferences
                .setString("phone", response['data']['phone_no'].toString());

            myservices.sharedPreferences.setString("step", "2");


        Get.offNamed(AppRoute.test);
      } else {
        Get.defaultDialog(
            title: "Warning ", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  resendVerifyCode(email) {
    verifyCodeSignUpData.resendVerifyCodeData(email);
  }

  @override
  void onInit() {
    email = Get.arguments['email']; //signupController ببعتو من صفحة ال
    super.onInit();
  }
}
