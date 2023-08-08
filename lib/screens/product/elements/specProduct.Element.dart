import 'package:flutter/material.dart';

import '../../../configs/appStyle.Config.dart';
import '../../../data/appData.dart';
import '../product.Controller.dart';

class SpecProductElement extends StatefulWidget {
  SpecProductElement({super.key});

  @override
  State<SpecProductElement> createState() => _SpecProductElementState();
}

class _SpecProductElementState extends State<SpecProductElement> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      color: AppColor.whiteColor,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal:AppDatas.marginHorital,vertical: AppDatas.marginVerital),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Thông số kỹ thuật",style: TextStyle(color: AppColor.blackText,fontSize: 18,fontWeight: FontWeight.w600),),
          Divider(height: 10,color: AppColor.grey.withOpacity(.5),),
          _buildRowSpaceBetween(title: "SKU",value: "31030131"),
          _buildRowSpaceBetween(title: "Xuất xứ",value: ProductController.initance.itemProduct.value.origin??""),
          _buildRowSpaceBetween(title: "Bán chạy nhất",value: "${ProductController.initance.itemProduct.value.sold??0}"),
          _buildRowSpaceBetween(title: "Màu sắc",value: ProductController.initance.itemProduct.value.color??""),
          _buildRowSpaceBetween(title: "Kích thước (Bao bì)",value: ProductController.initance.itemProduct.value.paddingSize??""),
          _buildRowSpaceBetween(title: "Phân loại",value: ProductController.initance.itemProduct.value.type??""),
          _buildRowSpaceBetween(title: "Giới tính",value: ProductController.initance.itemProduct.value.sex??""),
          _buildRowSpaceBetween(title: "Size",value: ProductController.initance.itemProduct.value.size??""),
        ],
      ),
    );
  }

  Widget _buildRowSpaceBetween({String title = "",String value = ""}){
    return Column(
      children: [
        const SizedBox(height: 5,),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(title)
            ),
            Expanded(
              flex: 8,
              child: Text(value,textAlign: TextAlign.end,)
            )
          ],
        ),
        const SizedBox(height: 5,),
        Divider(height: 10,color: AppColor.grey.withOpacity(.5),),
      ],
    );
  }
}