import 'package:get/get.dart';
import 'package:restaurantapp/core/class/crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut(() => SignUpControllerImp());
    Get.put(Crud()); //Crud crud  = Crud(); حط  controller بلا ما بكل
  }
}
