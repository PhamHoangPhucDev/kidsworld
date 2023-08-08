import 'package:flutter/material.dart';
import 'package:kidsworld/data/appData.dart';
import 'package:kidsworld/screens/home/home.Controller.dart';

import '../../../configs/appStyle.Config.dart';
import 'iconCatalog.Element.dart';

class CatalogHomeElement extends StatefulWidget {
  CatalogHomeElement({super.key});

  @override
  State<CatalogHomeElement> createState() => _CatalogHomeElementState();
}

class _CatalogHomeElementState extends State<CatalogHomeElement> {
  late Size size;
  @override
  Widget build(BuildContext context) {
  size = MediaQuery.of(context).size;
  
    // return Container(
    //   width: size.width,
    //   height: size.height*.18,
    //   color: AppColor.whiteColor,
    //   padding: EdgeInsets.symmetric(vertical: AppDatas.marginVerital),
    //   child: GridView(
    //     shrinkWrap: true,
    //     primary: false,
    //     scrollDirection: Axis.horizontal,
    //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //       maxCrossAxisExtent: size.width,
    //       childAspectRatio: size.width/(size.height*.5),
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 10
    //     ),
    //     children: [

    //         IconCatalog(icon: Icons.dashboard,colorBackground: AppColor.yellow,title: "Danh mục",),
    //         IconCatalog(icon: Icons.card_giftcard_outlined,title: "Khuyến mãi",),
    //         IconCatalog(icon: Icons.favorite_border_outlined,title: "Hệ thống cửa hàng",),
    //         IconCatalog(icon: Icons.child_care_outlined,title: "Thương hiệu nổi bật",),
    //         IconCatalog(icon: Icons.headset_mic_outlined,title: "Hỏi đáp",), 
    //     ],
    //   ),
    // );
    return Container(
      width: size.width,
      height: size.height*.18,
      color: AppColor.whiteColor,
      padding: EdgeInsets.symmetric(vertical: AppDatas.marginVerital),
      child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: HomeController.initance.listCatalog.map((e) 
            => SizedBox(
              width: size.width*.2,
              child: IconCatalog(icon: e.value,colorBackground: e.value2,title: e.name,))
          ).toList(),
        ),
      ),
    );
  }
}