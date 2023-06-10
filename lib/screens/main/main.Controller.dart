import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/appData.dart';
import '../../routers/app.Router.dart';
import '../catalog/catalog.Binding.dart';
import '../catalog/catalog.Container.dart';
import '../discount/discount.Binding.dart';
import '../discount/discount.Container.dart';
import '../home/home.Binding.dart';
import '../home/home.Container.dart';
import '../notify/notify.Binding.dart';
import '../notify/notify.Container.dart';
import '../profile/profile.Binding.dart';
import '../profile/profile.Container.dart';

class MainController extends GetxController with GetTickerProviderStateMixin {
  RxInt tabIndex = 0.obs;
  RxInt tabIndexOld = 0.obs;
  List<String> routerList = [AppRouter.home,AppRouter.catalog,AppRouter.discount,AppRouter.notify, AppRouter.profile];
  // late TabController tabController;
  @override
  void onInit() {
    super.onInit();
    // tabController = TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    // tabController.dispose();
    super.onClose();
  }

  void switchTap(int index) {
    if (index != tabIndex.value) {
      tabIndexOld.value = tabIndex.value;
      tabIndex.value = index;
      //Get.toNamed(routerList[index]);
      // tabController.index = tabIndex.value;
      Get.keys[AppKey.keyTabMain]!.currentState!.pushNamed(routerList[index]);
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    int indexPage = routerList.indexOf(settings.name!);
    Transition transition = Transition.leftToRight;
    if(tabIndexOld.value < indexPage){
      transition = Transition.rightToLeft;
    }
    switch (settings.name) {
      case AppRouter.home:
        return GetPageRoute(
          transition: transition,
          settings: settings,
          page: () => HomeScreen(),
          binding: HomeBinding(),
        );
      case AppRouter.catalog:
        return GetPageRoute(
          transition: transition,
          settings: settings,
          page: () => CatalogScreen(),
          binding: CatalogBinding(),
        );
      case AppRouter.discount:
        return GetPageRoute(
          transition: transition,
          settings: settings,
          page: () => DiscountScreen(),
          binding: DiscountBinding(),
        );
      case AppRouter.notify:
        return GetPageRoute(
          transition: transition,
          settings: settings,
          page: () => NotifyScreen(),
          binding: NotifyBinding(),
        );
      case AppRouter.profile:
        return GetPageRoute(
          transition: transition,
          settings: settings,
          page: () => ProfileScreen(),
          binding: ProfileBinding(),
        );
      default:
        return GetPageRoute(
          transition: transition,
          settings: settings,
          page: () => HomeScreen(),
          binding: HomeBinding(),
        );
    }
  }
}
