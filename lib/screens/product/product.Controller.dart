import 'package:get/get.dart';

import '../../models/apps/product.Model.dart';

class ProductController extends GetxController {
  RxBool isLoadingPage = false.obs;
  Rx<ProductModel> itemProduct = ProductModel().obs;
  RxList<ProductModel> listProduct = RxList.empty(growable: true);

  @override
  void onInit() {
    itemProduct.value = ProductModel(
        sysCode: "a12345678",
        srcImage: "https://tse3.mm.bing.net/th?id=OIP.9vYUdXFiyo-mdVeRfegmzgHaLH&pid=Api&P=0",
        name: "Bim bim - Sữa cà phê nguyên chất",
        describe: "Bim Bim - Sản phẩm an toàn và tiện dụng",
        origin: "Hàn Quốc",
        size: "XL",
        paddingSize: "30x5x15x40cm",
        color: "0",
        type: "Đồ ăn",
        sex: "0",
        sold: 1790,
        priceNew: 200,
        priceOld: 400,
        star: 50,
        favorite: 100,
        prdGif: false,
        prdHot: true,
        prdSale: true,
      );

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
  void onReady() {
    super.onReady();
  }
}