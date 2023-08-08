import 'package:get/get.dart';

import 'staticAuth.Controller.dart';


class StaticAuthBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>StaticAuthController());
  }
}