import 'package:get/get.dart';

import 'discount.Controller.dart';

class DiscountBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>DiscountController());
  }
}