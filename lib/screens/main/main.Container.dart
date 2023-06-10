import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/screens/notify/notify.Controller.dart';

import '../../components/tabBars/tabBarBottom.Component.dart';
import '../../configs/appStyle.Config.dart';
import '../../data/appData.dart';
import '../../routers/app.Router.dart';
import 'main.Controller.dart';

class MainScreen extends GetWidget<MainController> {
  MainController mainController = Get.find();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar()
      extendBody:false,
      body: _buildPageView(),
      bottomNavigationBar: Obx(()=>TabBottomComponent(
        switchTap: mainController.switchTap,
        tabIndex: mainController.tabIndex.value,
        tabItems: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "Danh mục"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_rounded),label: "Khuyến mãi"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined),label: "Thông báo"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Tài khoản"),
        ],
      )),
    );
  }
  Widget _buildPageView() {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Navigator(
        key: Get.nestedKey(AppKey.keyTabMain),
        initialRoute: AppRouter.home,
        onGenerateRoute: mainController.onGenerateRoute,
      ),
    );
  }
}
