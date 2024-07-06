import 'package:restaurantapp/core/class/crud.dart';
import 'package:restaurantapp/linkApi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postdata(String email) async {
    var response = await crud.postData(AppLink.checkemail, {
      // re-send otp via email

      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
