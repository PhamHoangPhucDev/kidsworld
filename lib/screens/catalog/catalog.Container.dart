import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/boxs/boxCatalog.Component.dart';
import '../../components/carouselSlider/imgSlider.Component.dart';
import '../../configs/appStyle.Config.dart';
import 'catalog.Controller.dart';
import 'elements/itemCatalog.Element.dart';

class CatalogScreen extends GetWidget<CatalogController> {
  final CatalogController catalogController = Get.find();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageSliderComponent(listSrcImage: catalogController.imgList,centerPage: true),
          
            BoxCatalogComponent(
              title: "Danh mục",
              rowGidview: 3,
              axisExtent: size.width*.5,
              listCatalog: [
                ItemCalalogElement(color: AppColor.yellow,title: "Mẹ bầu và sau sinh",imgPath: "https://media.istockphoto.com/id/1138262866/vi/vec-to/m%E1%BA%B9-b%E1%BA%A7u-glyph-icon-m%E1%BA%B9-v%C3%A0-con-d%E1%BA%A5u-hi%E1%BB%87u-ph%E1%BB%A5-n%E1%BB%AF-mang-thai-%C4%91%E1%BB%93-h%E1%BB%8Da-vector-m%E1%BB%99t-m%C3%B4-h%C3%ACnh-v%E1%BB%AFng-ch%E1%BA%AFc.jpg?s=612x612&w=0&k=20&c=q5tkVJbCS9xE7aaL2TaUJC9ol9r-daKjZeNTxpLmGLs=",),
                ItemCalalogElement(color: AppColor.yellow,title: "Mẹ bầu và sau sinh bỉm tả cho con và sau khi bú",imgPath: "https://media.istockphoto.com/id/1138262866/vi/vec-to/m%E1%BA%B9-b%E1%BA%A7u-glyph-icon-m%E1%BA%B9-v%C3%A0-con-d%E1%BA%A5u-hi%E1%BB%87u-ph%E1%BB%A5-n%E1%BB%AF-mang-thai-%C4%91%E1%BB%93-h%E1%BB%8Da-vector-m%E1%BB%99t-m%C3%B4-h%C3%ACnh-v%E1%BB%AFng-ch%E1%BA%AFc.jpg?s=612x612&w=0&k=20&c=q5tkVJbCS9xE7aaL2TaUJC9ol9r-daKjZeNTxpLmGLs=",),
                ItemCalalogElement(color: AppColor.yellow,title: "Mẹ bầu và sau sinh bỉm tả cho con và sau khi bú",imgPath: "https://media.istockphoto.com/id/1138262866/vi/vec-to/m%E1%BA%B9-b%E1%BA%A7u-glyph-icon-m%E1%BA%B9-v%C3%A0-con-d%E1%BA%A5u-hi%E1%BB%87u-ph%E1%BB%A5-n%E1%BB%AF-mang-thai-%C4%91%E1%BB%93-h%E1%BB%8Da-vector-m%E1%BB%99t-m%C3%B4-h%C3%ACnh-v%E1%BB%AFng-ch%E1%BA%AFc.jpg?s=612x612&w=0&k=20&c=q5tkVJbCS9xE7aaL2TaUJC9ol9r-daKjZeNTxpLmGLs=",),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
