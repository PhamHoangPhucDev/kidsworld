import 'package:get/get.dart';

import 'shoppingCart.Controller.dart';

class ShoppingCartBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ShoppingCartController());
  }
}