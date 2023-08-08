import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/components/tabBars/tabBar.Component.dart';
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
    return TabBarComponent(
      listTab: notifyController.myTabs,
      listPageView: notifyController.myListPage,
      colorTab: AppColor.nearlyBlue,
    );
  }
}
