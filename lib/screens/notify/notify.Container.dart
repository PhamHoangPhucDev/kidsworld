import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/data/appData.dart';

import '../../components/tabBars/tabBarTop.Component.dart';
import '../../configs/appStyle.Config.dart';
import '../../routers/app.Router.dart';
import 'notify.Controller.dart';

class NotifyScreen extends GetWidget<NotifyController> {
  final NotifyController notifyController = Get.find();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Obx(()=>TabBarTopComponent(
      tabs: notifyController.myTabs,
      current: notifyController.tabIndex.value,
      onTap: notifyController.switchTap,
      tabViews: Container(
        height: size.height,
        width: size.width,
        child: Navigator(
          key: Get.nestedKey(AppKey.keyTabNotify),
          initialRoute: AppRouter.transfer,
          onGenerateRoute: notifyController.onGenerateRouteNotify,
        ),
      ),
    ));
  }
}
