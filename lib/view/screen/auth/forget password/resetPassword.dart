import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/auth/forget%20Password/resetPasswordController.dart';
import 'package:restaurantapp/core/class/handlingDataView.dart';
import 'package:restaurantapp/core/constant/color.dart';
import 'package:restaurantapp/core/function/validationinput.dart';
import 'package:restaurantapp/view/widget/auth/custombuttonauth.dart';
import 'package:restaurantapp/view/widget/auth/customsignintextbodyauth.dart';
import 'package:restaurantapp/view/widget/auth/customtextformauth.dart';
import 'package:restaurantapp/view/widget/auth/customtexttitleauth.dart';
import 'package:restaurantapp/view/widget/auth/logoauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordcontroller controller = Get.put(ResetPasswordcontroller());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.white,
          elevation: 0.0, // لحتى يشيل الخط ويكون بنفس مستوى الصفخه
          centerTitle: true,
          title: Text(
            "Reset Password",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
          )),
      body:
          GetBuilder<ResetPasswordcontroller>(builder: (controller) =>

          //         controller.statusRequest == StatusRequest.loading
          //  ?
          //        const Center(child: Text("loading ..,"))
          //  :
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

              // start logo
              const LogoAuth(),
              // End logo

              CustomTextTitleAuth(
                text: "New Password",
              ),
              //// End Welcome
              const SizedBox(
                height: 10.0,
              ),

              /// Start Sign in Text Body
              CustomSignInTextBodyAuth(
                  textBody: "Enter the New Password to Login again"),

              /// End Sig in Text Body

              const SizedBox(height: 25.0),

              //////// Start 2nd textFormfeild
              CustomTextFormAuth(
                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
                mycontroller: controller.password,
                hinttext: "password",
                labeltext: "password",
                iconData: Icons.lock_outlined,
                isNumber: false,
                 obscreText: controller.isPasswordShow,
                onTapIcon: () {
                  controller.showPassword();
                },
              ),
              //////// End 2nd textFormfeild
              ///

              //////// Start 2nd textFormfeild
              CustomTextFormAuth(
                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
                mycontroller: controller.repassword,
                hinttext: "re-enter password",
                labeltext: "re-enter password",
                iconData: Icons.lock_outlined,
                isNumber: false,
                obscreText: controller.isPasswordShow,
                onTapIcon: () {
                  controller.showPassword();
                },
              ),
              //////// End 2nd textFormfeild

              // Start Forget Password  And Button Sign in

              CustomButtonAuth(
                text: "save",
                onPressed: () {
                  //  controller.resetPassword();
                  controller.goToSuccesrestPasswordPage();
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
