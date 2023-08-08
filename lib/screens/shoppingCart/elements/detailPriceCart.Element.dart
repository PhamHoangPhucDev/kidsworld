
import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';
import 'package:kidsworld/data/appData.dart';

import '../../../models/apps/product.Model.dart';

class DetailPriceCartElement extends StatefulWidget {
  const DetailPriceCartElement({super.key,required this.listPrd});
  final List<ProductModel> listPrd;
  @override
  State<DetailPriceCartElement> createState() => _DetailPriceCartElementState();
}

class _DetailPriceCartElementState extends State<DetailPriceCartElement> {
  double total = 0;
  void totalPricePrd(){
    for (var element in widget.listPrd) { 
      total += element.priceNew??0;
    }
  }

  @override
  void initState() {
    totalPricePrd();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDatas.marginHorital),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tổng giá sản phẩm",style: DesignCourseAppTheme.font13,),
              Text("$totalđ",style: DesignCourseAppTheme.font13,)
            ],
          ),
          SizedBox(height: AppDatas.paddingHeight,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Phí vận chuyển",style: DesignCourseAppTheme.font13,),
              Text("Có thể phát sinh",style: DesignCourseAppTheme.font13,)
            ],
          ),
          SizedBox(height: AppDatas.paddingHeight,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tổng tiền",style: DesignCourseAppTheme.font16,),
              Text("$totalđ",style: TextStyle(color: AppColor.brightRed,fontSize: 16,fontWeight: FontWeight.bold),)
            ],
          ),
          
        ],
      ),
    );
  }
}