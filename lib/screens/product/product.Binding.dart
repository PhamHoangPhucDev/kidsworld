import 'package:get/get.dart';

import 'product.Controller.dart';

class ProductBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ProductController());
  }
}