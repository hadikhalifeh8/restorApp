import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:restaurantapp/controller/auth/verifyCodeSignupController.dart';
import 'package:restaurantapp/core/class/handlingDataView.dart';
import 'package:restaurantapp/core/constant/color.dart';
import 'package:restaurantapp/view/widget/auth/customsignintextbodyauth.dart';
import 'package:restaurantapp/view/widget/auth/customtexttitleauth.dart';
import 'package:restaurantapp/view/widget/auth/logoauth.dart';


class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpController controller =   Get.put(VerifyCodeSignUpController());
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
      body:         GetBuilder<VerifyCodeSignUpController>(builder: (controller) =>
        
        // controller.statusRequest ==StatusRequest.loading ?
        //   const  Center(child: Text("Loading ..."),) :

        // HandlingDataRequest : loading / offline / serverfailure/ ...
     HandlingDataRequest(statusRequest: controller.statusRequest,
           widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
        child: ListView(
          children: [
            ///// Start welcome
            const LogoAuth(),
            
            CustomTextTitleAuth(
              text: "check code",
            ),
            //// End Welcome
            const SizedBox(
              height: 10.0,
            ),

            /// Start Sign in Text Body
            CustomSignInTextBodyAuth(textBody: "Please Enter the Digit Code That send \n to: xxxxx@gmail.com"),

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
        onSubmit: (String verificationCode){
            controller.goTohomepage(verificationCode);
        }, // end onSubmit
    ),
  //////// End  Verify Code
   
SizedBox(height: 35.0,),
            
           InkWell(onTap: () {controller.resendVerifyCode(controller.email!);}, 
           child: const Center(child: Text("Resend Verify Code", style: TextStyle(color: AppColor.primaryColor, fontSize: 20),)),)
          ],
        ),
      ),))
    );
  }
}
 