import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/models/apps/product.Model.dart';

class HomeController extends GetxController {
  RxBool isLoadingPage = false.obs;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  RxList<ProductModel> listProduct = RxList.empty(growable: true);
  @override
  void onInit() {
    listProduct.addAll([
      ProductModel(
        sysCode: "a12345678",
        srcImage: "https://tse3.mm.bing.net/th?id=OIP.9vYUdXFiyo-mdVeRfegmzgHaLH&pid=Api&P=0",
        name: "Bim bim - Sữa cà phê nguyên chất",
        priceNew: 200,
        priceOld: 400,
        star: 50,
        favorite: 100,
        prdGif: false,
        prdHot: true,
        prdSale: true,
      ),
      ProductModel(
        sysCode: "a12345678",
        srcImage: "https://tse3.mm.bing.net/th?id=OIP.9vYUdXFiyo-mdVeRfegmzgHaLH&pid=Api&P=0",
        name: "Bim - Tã quần Moony size M 52 miếng (6 miếng thông khô siêu tốc)",
        priceNew: 385000,
        priceOld: 395000,
        star: 5,
        favorite: 64,
        prdGif: true,
        prdHot: true,
        prdSale: true,
      )
    ]);
    super.onInit();
  }

  @override
  void onReady() async {
    // await Future.delayed(const Duration(hours: 1),() { isLoadingPage.value = false;});
    super.onReady();
  }
}
