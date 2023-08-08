import 'package:get/get.dart';

import '../screens/authen/authen.Binding.dart';
import '../screens/authen/authen.Container.dart';
import '../screens/main/main.Binding.dart';
import '../screens/main/main.Container.dart';
import '../screens/product/product.Binding.dart';
import '../screens/product/product.Container.dart';
import '../screens/shoppingCart/shoppingCart.Binding.dart';
import '../screens/shoppingCart/shoppingCart.Container.dart';
import '../screens/staticAuth/staticAuth.Binding.dart';
import '../screens/staticAuth/staticAuth.Container.dart';
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
    GetPage(
      name: AppRouter.authen,
      page: () => AuthenScreen(),
      binding: AuthenBinding(),
    ),
    GetPage(
      name: AppRouter.shoppingCart,
      page: () => ShoppingCartScreen(),
      binding: ShoppingCartBinding(),
    ),


    GetPage(
      name: AppRouter.staticAuth,
      page: () => StaticAuthScreen(),
      binding: StaticAuthBinding(),
    ),
  ];
}
