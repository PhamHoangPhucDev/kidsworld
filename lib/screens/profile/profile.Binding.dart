import 'package:get/get.dart';
import 'profile.Controller.dart';

class ProfileBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ProfileController());
  }
}