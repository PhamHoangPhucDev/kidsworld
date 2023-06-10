import 'package:get/get.dart';

import 'main.Controller.dart';

class MainBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>MainController());
  }
}