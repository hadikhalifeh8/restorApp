import 'package:restaurantapp/core/class/crud.dart';
import 'package:restaurantapp/linkApi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postdata(String name, String email, String phoneno, String password) async {
    // var response = await crud.postData(linkurl, {})
    var response = await crud.postData(AppLink.signup, {
      // data from backend(nafs l 2asma2)

      "name": name, // name from backend / php  :name from controller
      "email": email, //   email from backend / php:email from controller
      "phone_no":
          phoneno, //  phone_no from backend / php  : phoneno from controller
      "password":
          password, // password from backend / php : password from controller
    });
    return response.fold((l) => l, (r) => r);
  }
}
