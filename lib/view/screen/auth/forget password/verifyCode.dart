import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:restaurantapp/controller/auth/forget%20Password/verifyCodeController.dart';
import 'package:restaurantapp/core/constant/color.dart';
import 'package:restaurantapp/view/widget/auth/customsignintextbodyauth.dart';
import 'package:restaurantapp/view/widget/auth/customtexttitleauth.dart';
import 'package:restaurantapp/view/widget/auth/logoauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeController controller = Get.put(VerifyCodeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0.0, // لحتى يشيل الخط ويكون بنفس مستوى الصفخه
        centerTitle: true,
        title: Text(
          "Verification Code",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor),
        ),
      ),
      body: Container(
        color: AppColor.white,
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
        child: ListView(
          children: [
            ///// Start welcome

            // start logo
            const LogoAuth(),
            // End logo
            CustomTextTitleAuth(
              text: "check Code",
            ),
            //// End Welcome
            const SizedBox(
              height: 10.0,
            ),

            /// Start Sign in Text Body
            CustomSignInTextBodyAuth(
                textBody:
                    "Please Enter the Digit Code That send \n to: xxxxx@gmail.com"),

            /// End Sig in Text Body

            const SizedBox(height: 25.0),

            //////// Start Verify Code
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20.0),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.goToResetPasswordPage(verificationCode);
                // controller.goToRessetPassword();
              }, // end onSubmit
            ),
            //////// End  Verify Code
          ],
        ),
      ),
    );
  }
}
