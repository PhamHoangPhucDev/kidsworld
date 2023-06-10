import 'package:get/get.dart';

import '../screens/main/main.Binding.dart';
import '../screens/main/main.Container.dart';
import '../screens/product/product.Binding.dart';
import '../screens/product/product.Container.dart';
import 'app.Router.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRouter.main,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRouter.product,
      page: () => ProductScreen(),
      binding: ProductBinding(),
    ),
  ];
}
