import 'package:get/get.dart';

import '../../../../models/apps/prCodeName.Model.dart';

class SaleController extends GetxController {
  RxList<PrCodeName> listSale = RxList.empty(growable: true);
  @override
  void onInit() {
    listSale.value = [
      PrCodeName(code: '1',name: 'Tả em bé UniDry ưu đãi Tháng 9 tại Shop?',codeDisplay: 'Tả dán Unity giảm giá 20% Tã khuyến mãi cực kì cao',value: 'https://cdn.chanhtuoi.com/uploads/2022/03/shopee-4-4-1.jpg'),
      PrCodeName(code: '1',name: 'Tả em bé UniDry ưu đãi Tháng 9 tại Shop?',codeDisplay: 'Tả dán Unity giảm giá 20% Tã khuyến mãi cực kì cao',value: 'https://cdn.chanhtuoi.com/uploads/2022/03/shopee-4-4-1.jpg'),
      PrCodeName(code: '1',name: 'Tả em bé UniDry ưu đãi Tháng 9 tại Shop?',codeDisplay: 'Tả dán Unity giảm giá 20% Tã khuyến mãi cực kì cao',value: 'https://cdn.chanhtuoi.com/uploads/2022/03/shopee-4-4-1.jpg'),
      PrCodeName(code: '1',name: 'Tả em bé UniDry ưu đãi Tháng 9 tại Shop?',codeDisplay: 'Tả dán Unity giảm giá 20% Tã khuyến mãi cực kì cao',value: 'https://cdn.chanhtuoi.com/uploads/2022/03/shopee-4-4-1.jpg'),
    ];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}