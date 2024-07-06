import 'package:restaurantapp/core/class/crud.dart';
import 'package:restaurantapp/linkApi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postdata(String email, String password) async {
    // var response = await crud.postData(linkurl, {})
    var response = await crud.postData(AppLink.login, {
      // data from backend(nafs l 2asma2)

      "email": email, //   email from backend / php:email from controller
      "password":
          password, // password from backend / php : password from controller
    });
    return response.fold((l) => l, (r) => r);
  }
}
