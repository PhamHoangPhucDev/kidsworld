import 'package:flutter/material.dart';

import '../../../components/boxs/elements/stackImagePrd.Element.dart';
import '../../../components/boxs/elements/starAndFavorite.Element.dart';
import '../../../configs/appIcon.Config.dart';
import '../../../configs/appStyle.Config.dart';
import '../../../data/appData.dart';
import '../../../utility/app.Utility.dart';
import '../../main/main.Controller.dart';
import '../product.Controller.dart';

class InforProductElement extends StatefulWidget {
  InforProductElement({super.key});

  @override
  State<InforProductElement> createState() => _InforProductElementState();
}

class _InforProductElementState extends State<InforProductElement> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      color: AppColor.whiteColor,
      padding: EdgeInsets.symmetric(horizontal:AppDatas.marginHorital),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StackImagePrdElement(
            width: size.width,
            height: size.height*.4,
            alertImage: true,
            prd: ProductController.initance.itemProduct.value,
          ),
          Text(ProductController.initance.itemProduct.value.name??"",style: TextStyle(color: AppColor.blueColor,fontSize: 18,fontWeight: FontWeight.bold),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Thương hiệu: ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Moony', style: TextStyle(color: AppColor.nearlyBlue, fontSize: 13)),
                  ],
                ),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: 'Mã SP: ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(text: ProductController.initance.itemProduct.value.sysCode??"", style: const TextStyle(color: AppColor.nearlyBlue, fontSize: 13)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          StarAndFavoriteElement(
            prd: ProductController.initance.itemProduct.value,
            sizeIcon: 20,
            sizeDetail: true,
            rating: getAvgEvaluate(ProductController.initance.itemProduct.value.evaluates?.listEvaluates),
          ),
          SizedBox(height: AppDatas.paddingHeight,),
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital,vertical: AppDatas.marginVerital),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: AppColor.blackText.withOpacity(.05)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${compactNumberToText(ProductController.initance.itemProduct.value.priceNew)}đ",style: TextStyle(fontSize: 20,color: AppColor.brightRed,fontWeight: FontWeight.w600),),
                (ProductController.initance.itemProduct.value.priceOld??0) > 0
                ?Text("${compactNumberToText(ProductController.initance.itemProduct.value.priceOld)}đ",style: TextStyle(fontSize: 18,color: AppColor.darkText,decoration: TextDecoration.lineThrough))
                :const SizedBox(),
              ],
            )
          ),
          SizedBox(height: AppDatas.paddingHeight,),
          Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: AppColor.grey.withOpacity(.5))
            ),
            child: ListTile(
              leading: Image.asset(AppIcons.carShipping_icon),
              title: const Text("Miễn phí vận chuyển",style: TextStyle(color: AppColor.blackText,fontSize: 18),),
              subtitle: const Text("Miễn phí vận chuyển cho đơn hàng trên ${150.000}đ"),
            ),
          ),
          SizedBox(height: AppDatas.paddingHeight*2,)
        ],
      ),
    );
  }
}