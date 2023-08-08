import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/screens/main/main.Controller.dart';

import '../../../../components/appBar/defaultAppBar.Component.dart';
import '../../../../components/boxs/boxProduct.Component.dart';
import '../../../../components/viewListItem/listView.Component.dart';
import '../../../../configs/appStyle.Config.dart';
import '../../../../data/appData.dart';
import '../../../../models/apps/product.Model.dart';
import '../../../../routers/app.Router.dart';
import 'prdFavorite.Controller.dart';

class PrdFavoriteScreen extends GetWidget<PrdFavoriteController> {
  final prdFavoriteController = Get.put(PrdFavoriteController());
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    prdFavoriteController.context = context;
    return Scaffold(
      appBar: DefaultAppBarComponent(
        leading: true,
        title: "Sản phẩm yêu thích",
      ),
      body: Obx(() =>SingleChildScrollView(
        child: !prdFavoriteController.isLoadingPage.value
          ?Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                color: AppColor.greyOpa,
                width: size.width,
                child: FutureBuilder<List<ProductModel>>(
                  future: prdFavoriteController.fireProduct.getListProductsFavoriteByUser(MainController.initance.userData.value.code),
                  builder: (context, snapshot) {
                    return Text(
                      "Bạn có ${snapshot.data != null?snapshot.data!.length:0} sản phẩm yêu thích",
                      style: TextStyle(fontSize: 13,height: 3),
                    );
                  },
                )
              ),
              ListViewComponent(
                future: prdFavoriteController.fireProduct.getListProductsFavoriteByUser(MainController.initance.userData.value.code),
                onTap: (index,data){
                  Get.toNamed(AppRouter.product,arguments: data[index].sysCode)?.then((value) => prdFavoriteController.refresh());
                },
                onRefresh: prdFavoriteController.refresh
              )
            ],
          ):Center(child: CircularProgressIndicator()),
      ))
    );
  }
}