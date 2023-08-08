import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/appData.dart';
import '../../routers/app.Router.dart';
import 'pages/sale/sale.Container.dart';
import 'pages/sale/sale.Controller.dart';
import 'pages/system/system.Container.dart';
import 'pages/system/system.Controller.dart';
import 'pages/transfer/transfer.Container.dart';
import 'pages/transfer/transfer.Controller.dart';

class NotifyController extends GetxController {
  late List<String> myTabs = <String>[];
  late List<Widget> myListPage = <Widget>[];
  
  @override
  void onInit() {
    myTabs = [
      'Đơn hàng',
      'Khuyến mãi',
      'Hệ thống',
    ];
    myListPage = [TransferScreen(),SaleScreen(),SystemScreen()];
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  // Route? onGenerateRouteNotify(RouteSettings settings) {
  //   int indexPage = routerList.indexOf(settings.name!);
  //   Transition transition = Transition.leftToRight;
  //   if(tabIndexOld.value < indexPage){
  //     transition = Transition.rightToLeft;
  //   }
  //   switch (settings.name) {
  //     case AppRouter.transfer:
  //       return GetPageRoute(
  //         transition: transition,
  //         settings: settings,
  //         page: () => TransferScreen(),
  //         binding: BindingsBuilder(() {
  //           Get.lazyPut<TransferController>(
  //             () => TransferController(),
  //           );
  //         },)
  //       );
  //     case AppRouter.sale:
  //       return GetPageRoute(
  //         transition: transition,
  //         settings: settings,
  //         page: () => SaleScreen(),
  //         binding: BindingsBuilder(() {
  //           Get.lazyPut<SaleController>(
  //             () => SaleController(),
  //           );
  //         }),
  //       );
  //     case AppRouter.system:
  //       return GetPageRoute(
  //         transition: transition,
  //         settings: settings,
  //         page: () => SystemScreen(),
  //         binding: BindingsBuilder(() {
  //           Get.lazyPut<SystemController>(
  //             () => SystemController(),
  //           );
  //         },),
  //       );
  //     default:
  //       return GetPageRoute(
  //         transition: transition,
  //         settings: settings,
  //         page: () => TransferScreen(),
  //         binding: BindingsBuilder(() {
  //           Get.lazyPut<TransferController>(
  //             () => TransferController(),
  //           );
  //         },)
  //       );
  //   }
  // }
}
