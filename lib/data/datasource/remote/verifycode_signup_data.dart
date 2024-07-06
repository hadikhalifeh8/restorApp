import 'package:restaurantapp/core/class/crud.dart';
import 'package:restaurantapp/linkApi.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);

  postdata(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verfycodesignup, {
      // loginWithOTP function

      "email": email,
      "verify_code": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendVerifyCodeData(String email) async {
    var response = await crud.postData(AppLink.resendVerifyCode, {
      // loginWithOTP function

      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
