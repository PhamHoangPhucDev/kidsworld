import 'package:get/get.dart';
import 'authen.Controller.dart';

class AuthenBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>AuthenController());
  }
}