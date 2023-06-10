import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'discount.Controller.dart';

class DiscountScreen extends GetWidget<DiscountController> {
  final DiscountController discountController = Get.find();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Center(child: Container(child: Text("Discount"),));
  }
}
