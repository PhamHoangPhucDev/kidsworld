import 'package:get/get.dart';
import 'package:kidsworld/data/appData.dart';

import '../../models/apps/product.Model.dart';

class ShoppingCartController extends GetxController {
  RxList<ProductModel> listPrd = <ProductModel>[].obs;
  @override
  void onInit() {
    // listPrd.value = [AppDatas.product1,AppDatas.product3,AppDatas.product2];
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }
}
