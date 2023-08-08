import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/models/apps/product.Model.dart';
import '../../configs/appStyle.Config.dart';
import '../../firebase/product.Firebase.dart';
import '../../models/apps/prCodeName.Model.dart';

class HomeController extends GetxController {
  static HomeController get initance => Get.find();

  late FireProduct fireProduct;
  RxBool isLoadingPage = true.obs;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  // RxList<ProductModel> listProduct = RxList.empty(growable: true);
  
  RxList<PrCodeName> listCatalog = RxList.empty(growable: true);// loại
  RxList<PrCodeName> listCategory = RxList.empty(growable: true);// danh mục
  
  @override
  void onInit() {
    fireProduct = FireProduct();
    super.onInit();
  }

  @override
  void onReady() {
    // await Future.delayed(const Duration(hours: 1),() { isLoadingPage.value = false;});
    initVar();
    refresh();
    super.onReady();
  }

  @override
  void refresh() {
    isLoadingPage.value = true;
    isLoadingPage.value = false;
    super.refresh();
  }

  initVar(){
    listCatalog.addAll([
      PrCodeName(value: Icons.dashboard,value2: AppColor.yellow,name: "Danh mục",value3: (){}),
      PrCodeName(value: Icons.card_giftcard_outlined,name: "Khuyến mãi",value3: (){}),
      PrCodeName(value: Icons.favorite_border_outlined,name: "Hệ thống cửa hàng",value3: (){}),
      PrCodeName(value: Icons.child_care_outlined,name: "Thương hiệu nổi bật",value3: (){}),
      PrCodeName(value: Icons.headset_mic_outlined,name: "Hỏi đáp",value3: (){}),    
    ]);

    listCategory.addAll([
      PrCodeName(value: Icons.dashboard,value2: AppColor.yellow,name: "Danh mục",value3: (){}),
      PrCodeName(value: Icons.card_giftcard_outlined,name: "Khuyến mãi",value3: (){}),
      PrCodeName(value: Icons.favorite_border_outlined,name: "Hệ thống cửa hàng",value3: (){}),
      PrCodeName(value: Icons.child_care_outlined,name: "Thương hiệu nổi bật",value3: (){}),
      PrCodeName(value: Icons.headset_mic_outlined,name: "Hỏi đáp",value3: (){}), 
      PrCodeName(value: Icons.headset_mic_outlined,name: "Hỏi đáp",value3: (){}),      
    ]);
  }
  
}
