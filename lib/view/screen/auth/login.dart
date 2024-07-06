import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/auth/loginController.dart';
import 'package:restaurantapp/core/class/handlingDataView.dart';
import 'package:restaurantapp/core/class/statusRequest.dart';
import 'package:restaurantapp/core/constant/color.dart';
import 'package:restaurantapp/core/function/alertexitapp.dart';
import 'package:restaurantapp/core/function/validationinput.dart';
import 'package:restaurantapp/view/widget/auth/custombuttonauth.dart';
import 'package:restaurantapp/view/widget/auth/customsignintextbodyauth.dart';
import 'package:restaurantapp/view/widget/auth/customtextformauth.dart';
import 'package:restaurantapp/view/widget/auth/customtextsignupORsignin.dart';
import 'package:restaurantapp/view/widget/auth/customtexttitleauth.dart';
import 'package:restaurantapp/view/widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Get.put(LoginControllerImp());

    LoginController controller = Get.put(LoginController());
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColor.white,
            elevation: 0.0, // لحتى يشيل الخط ويكون بنفس مستوى الصفخه
            centerTitle: true,
            title: const Text(
              "Sign In",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor),
            )),
        body: WillPopScope(
            onWillPop: alertExiteApp,
            child: GetBuilder<LoginController>(
                builder: (controller) =>
                    // controller.statusRequest ==
                    //         StatusRequest.loading
                    //     ? const Center(child: Text("loading ..,"))
                    //     :
                    HandlingDataRequest(
                        statusRequest: controller.statusRequest,
                        widget: Container(
                          color: AppColor.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 30.0),
                          child: Form(
                            key: controller.formstate,
                            child: ListView(
                              children: [
                                // start logo
                                const LogoAuth(),
                                // End logo
                                ///// Start welcome
                                const CustomTextTitleAuth(
                                  text: "welcome Back",
                                ),
                                //// End Welcome
                                const SizedBox(
                                  height: 10.0,
                                ),

                                /// Start Sign in Text Body
                                const CustomSignInTextBodyAuth(
                                    textBody:
                                        "Sign in With Your E-mail & PassWord."),

                                /// End Sig in Text Body

                                const SizedBox(height: 30.0),
                                //////// Start 1st textFormfeild
                                CustomTextFormAuth(
                                  valid: (val) {
                                    return validInput(val!, 5, 100, "email");
                                  },
                                  hinttext: "Enter E-mail",
                                  labeltext: "email",
                                  iconData: Icons.email_outlined,
                                  mycontroller: controller.email,
                                  isNumber: false,
                                  // mycontroller: ,
                                ),
                                //////// End 1st textFormfeild

                                //////// Start 2nd textFormfeild
                                GetBuilder<LoginController>(
                                  builder: (controller) => CustomTextFormAuth(
                                    valid: (val) {
                                      return validInput(
                                          val!, 5, 30, "password");
                                    },
                                    hinttext: "Enter Password",
                                    labeltext: "password",
                                    iconData: Icons.lock_outlined,
                                    mycontroller: controller.password,
                                    isNumber: false,
                                    obscreText: controller.isPasswordShow,
                                    onTapIcon: () {
                                      controller.showPassword();
                                    },
                                    //  mycontroller: controller.password,
                                  ),
                                ),
                                //////// End 2nd textFormfeild

                                // Start Forget Password  And Button Sign in
                                InkWell(
                                  onTap: () {
                                    controller.goToForgetPassword();
                                  },
                                  child: const Text(
                                    "forget password",
                                    textAlign: TextAlign.end,
                                  ),
                                ),

                                CustomButtonAuth(
                                  text: "Sign in",
                                  onPressed: () {
                                    controller.login();
                                  },
                                ),
                                // End Forget Password And Button Sign in
                                const SizedBox(
                                  height: 15.0,
                                ),
                                // start Don't have an account
                                CustomTextSignUpORSignIn(
                                  textone: "don't have an account!  ",
                                  texttwo: "Sign up",
                                  onTap: () {
                                    controller.goToSignUp();
                                  },
                                ),
                                // End Don't have an account
                              ],
                            ),
                          ),
                        )))));
  }
}
