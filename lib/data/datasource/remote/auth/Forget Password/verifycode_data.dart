import 'package:restaurantapp/core/class/crud.dart';
import 'package:restaurantapp/linkApi.dart';

class VerifyCodeResetPasswordData {
  Crud crud;
  VerifyCodeResetPasswordData(this.crud);

  postdata(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifyCodeResetPassword, {
      "email": email,
      "verify_code": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
