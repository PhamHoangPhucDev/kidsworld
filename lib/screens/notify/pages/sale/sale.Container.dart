import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../elements/boxItemNotify.Element.dart';
import 'sale.Controller.dart';

class SaleScreen extends GetWidget<SaleController> {
  final SaleController saleController = Get.put(SaleController());
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: saleController.listSale.length,
      itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: BoxItemNotifyElement(item: saleController.listSale[index],),
        );
      }
    );
  }
}