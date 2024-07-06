import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/auth/signupController.dart';
import 'package:restaurantapp/core/class/handlingDataView.dart';
import 'package:restaurantapp/core/constant/color.dart';
import 'package:restaurantapp/core/function/alertexitapp.dart';
import 'package:restaurantapp/core/function/validationinput.dart';
import 'package:restaurantapp/view/widget/auth/custombuttonauth.dart';
import 'package:restaurantapp/view/widget/auth/customsignintextbodyauth.dart';
import 'package:restaurantapp/view/widget/auth/customtextformauth.dart';
import 'package:restaurantapp/view/widget/auth/customtextsignupORsignin.dart';
import 'package:restaurantapp/view/widget/auth/customtexttitleauth.dart';
import 'package:restaurantapp/view/widget/auth/logoauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Get.lazyPut( () => SignUpControllerImp());// (OR بستعمل Binding)
    SignUpcontroller controller = Get.put(SignUpcontroller()); //getbuilder تحت بال  controller  عرفنا ال
    //  Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColor.white,
            elevation: 0.0, // لحتى يشيل الخط ويكون بنفس مستوى الصفخه
            centerTitle: true,
            title: const Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor),
            )),
        body:
            //  WillPopScope(
            // onWillPop: alertExiteApp,

            // child:

               GetBuilder<SignUpcontroller>
            (builder: (controller) =>

            // *******Loading ****** */
            // controller.statusRequest == StatusRequest.loading ?
            // const Center(child: Text("loading ..,"))  :
            // *******Loading ****** */

            // HandlingDataRequest : loading / offline / serverfailure ...

            
             HandlingDataRequest(statusRequest: controller.statusRequest,
                 widget:

            Container(
          color: AppColor.white,
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                const LogoAuth(),

                ///// Start welcome
                CustomTextTitleAuth(
                  text: "welcome ",
                ),
                //// End Welcome
                // const SizedBox(
                //   height: 1.0,
                // ),

                /// Start Sign in Text Body
                //  const CustomSignInTextBodyAuth(textBody: "Sign Up"),

                /// End Sig in Text Body

                const SizedBox(height: 25.0),

                //////// Start 1st textFormfeild
                CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 5, 20, "username");
                  },
                  mycontroller: controller.username,
                  hinttext: "Enter Username",
                  labeltext: "username",
                  iconData: Icons.person_outline,
                  isNumber: false,

                  //  mycontroller: ,
                ),
                //////// End 1st textFormfeild

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

                  //  mycontroller: ,
                ),
                //////// End 2nd textFormfeild

                //////// Start 3rd textFormfeild
                CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 9, 20, "phone");
                  },
                  mycontroller: controller.phoneno,
                  hinttext: "Enter Phone Number",
                  labeltext: "phone_number",
                  iconData: Icons.phone_android_outlined,
                  isNumber: true,
                ),
                //////// End 3rd textFormfeild

                //////// Start 4th textFormfeild
                GetBuilder<SignUpcontroller>(
                  builder: (controller) => CustomTextFormAuth(
                    valid: (val) {
                      return validInput(val!, 9, 50, "password");
                    },
                    mycontroller: controller.password,
                    hinttext: "Enter Password",
                    labeltext: "password",
                    iconData: Icons.lock_outlined,
                    isNumber: false,
                    obscreText: controller.isPasswordShow,
                    onTapIcon: () {
                      controller.showPassword();
                      
                    },
                  ),
                ),

                //////// End 4th textFormfeild

                // Start  Button Sign in

                CustomButtonAuth(
                  text: "Sign Uup",
                  onPressed: () {
                    controller.signUp();
                  },
                ),
                // End  Button Sign in
                const SizedBox(
                  height: 15.0,
                ),
                // start Don't have an account

                CustomTextSignUpORSignIn(
                  textone: "already have an account ",
                  texttwo: "Sign In",
                  onTap: () {
                    controller.goToLogin();
                  },
                ),

                // End Don't have an account
              ],
            ),
          ),
        )
        ),
        ),
        //  )
        );
  }
}
