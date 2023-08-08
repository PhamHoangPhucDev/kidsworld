import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/screens/main/main.Controller.dart';

import '../../../../firebase/product.Firebase.dart';
import '../../../../models/apps/product.Model.dart';

class PrdFavoriteController extends GetxController {
  static PrdFavoriteController get initance => Get.find();
  late BuildContext context;
  RxBool isLoadingPage = true.obs;
  late FireProduct fireProduct;
  // RxList<ProductModel> listProduct = RxList.empty(growable: true);

  @override
  void onInit() {
    fireProduct = FireProduct();
    super.onInit();
  }

  @override
  void onReady() {
    refresh();
    super.onReady();
  }

  @override
  refresh() {
    isLoadingPage.value = true;
    isLoadingPage.value = false;
    super.refresh();
  }
}