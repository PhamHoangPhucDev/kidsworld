import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appBar/defaultAppBar.Component.dart';
import '../../components/boxs/boxStackPositionBottom.Component.dart';
import '../../components/textButton/textButton.Component.dart';
import '../../configs/appStyle.Config.dart';
import '../../data/appData.dart';
import 'elements/detailPriceCart.Element.dart';
import 'elements/itemShoppingCart.Element.dart';
import 'shoppingCart.Controller.dart';

class ShoppingCartScreen extends GetWidget<ShoppingCartController> {
  final ShoppingCartController shoppingCartController = Get.find();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar : DefaultAppBarComponent(
        leading: true,
        title: "Giỏ hàng",
      ),
      body: BoxStackPositionBottomComponent(
        labelPosition: "TIẾN HÀNH THANH TOÁN",
        colorPosition: AppColor.brightRed,
        onPressPosition: (){},
        child: false
          ? Center(child: Text("CHƯA CÓ SẢN PHẨM",style: TextStyle(color: AppColor.nearlyBlue,fontSize: 16,fontWeight: FontWeight.bold),))
          : SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: shoppingCartController.listPrd.map((e) => 
                    Column(
                      children: [
                        ItemShoppingCartElement(prd: e,),
                        shoppingCartController.listPrd.last != e
                        ?Divider(height: AppDatas.paddingHeight,thickness: 1,indent: AppDatas.marginHorital,endIndent: AppDatas.marginHorital,)
                        :SizedBox(height: AppDatas.paddingHeight,)
                      ],
                    ))
                  .toList(),
                ),
                Container(
                  color: AppColor.darkText.withOpacity(.1),
                  height: AppDatas.paddingHeight,
                  width: size.width,
                ),
                DetailPriceCartElement(listPrd: shoppingCartController.listPrd,)
              ],
            ),
          ),
      )
    );
  }
}
