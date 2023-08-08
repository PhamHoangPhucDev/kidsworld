import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';

import '../../components/appBar/defaultAppBar.Component.dart';
import '../../components/tabBars/tabBar.Component.dart';
import 'authen.Controller.dart';

class AuthenScreen extends GetWidget<AuthenController> {
  final authenController = Get.put(AuthenController());
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultAppBarComponent(
        title: "Đăng nhập / Đăng ký",
      ),
      body: TabBarComponent(
        listTab: authenController.myTabs,
        listPageView: authenController.myListPage,
        colorTab: AppColor.whiteColor,
        scrollable: const AlwaysScrollableScrollPhysics(),
      ),
    );
  }
}
