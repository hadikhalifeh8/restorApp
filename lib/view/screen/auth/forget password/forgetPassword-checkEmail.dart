import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/auth/forget%20Password/forgetPassword-checkEmailController.dart';
import 'package:restaurantapp/core/class/handlingDataView.dart';
import 'package:restaurantapp/core/constant/color.dart';
import 'package:restaurantapp/core/function/validationinput.dart';
import 'package:restaurantapp/view/widget/auth/custombuttonauth.dart';
import 'package:restaurantapp/view/widget/auth/customsignintextbodyauth.dart';
import 'package:restaurantapp/view/widget/auth/customtextformauth.dart';
import 'package:restaurantapp/view/widget/auth/customtexttitleauth.dart';
import 'package:restaurantapp/view/widget/auth/logoauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Get.put(ForgetPasswordControllerImp());
    ForgetPasswordController controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.white,
          elevation: 0.0, // لحتى يشيل الخط ويكون بنفس مستوى الصفخه
          centerTitle: true,
          title: Text(
            "Forget Password",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
          )),
      body:
           GetBuilder<ForgetPasswordController>(builder: (controller)=>

          //  controller.statusRequest == StatusRequest.loading ?
          //      const Center(child: Text("loading ..,"))
          //       :

          // HandlingDataRequest : loading / offline / serverfailure/ ...

HandlingDataRequest(statusRequest: controller.statusRequest,
           widget:

          Container(
        color: AppColor.white,
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
        child: Form(
           key: controller.formstate,
          child: ListView(
            children: [
              ///// Start welcome
              ///
              // start logo
              const LogoAuth(),
              // End logo

              CustomTextTitleAuth(
                text: "check email",
              ),
              //// End Welcome
              const SizedBox(
                height: 10.0,
              ),

              /// Start Sign in Text Body
              //  CustomSignInTextBodyAuth(textBody: "forget pasword"),

              /// End Sig in Text Body

              const SizedBox(height: 25.0),

              //////// Start 2nd textFormfeild
              CustomTextFormAuth(
                valid: (val) {
                  return validInput(val!, 5, 100, "email");
                },
                mycontroller: controller.email,
                hinttext: "Enter E-mail",
                labeltext: "email",
                iconData: Icons.email_outlined,
                isNumber: false,
              ),
              //////// End 2nd textFormfeild

              // Start Forget Password  And Button Sign in

              CustomButtonAuth(
                text: "check".tr,
                onPressed: () {
                  controller.checkEmail();
                },
              ),
              // End Forget Password And Button Sign in
            ],
          ),
        ),
      ),
      )
      )
    );
  }
}
