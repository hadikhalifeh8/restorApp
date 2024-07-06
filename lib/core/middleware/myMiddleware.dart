
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/constant/routes.dart';
import 'package:restaurantapp/core/services/services.dart';

class MyMiddleware extends GetMiddleware{
  
  @override
  int? get priority => 1 ;

   MyServices  myservices = Get.find();

  @override
  RouteSettings? redirect(String? route){

      if(myservices.sharedPreferences.getString("step") == "2")
       {
         return const RouteSettings(name: AppRoute.test);
       }

    if(myservices.sharedPreferences.getString("step") == "1")
    {
     return const RouteSettings(name: AppRoute.login);
    }

   
    return null;
  }
}