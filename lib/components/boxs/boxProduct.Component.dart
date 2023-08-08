import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';
import 'package:kidsworld/data/appData.dart';
import 'package:kidsworld/models/apps/product.Model.dart';

import '../../utility/app.Utility.dart';
import 'elements/stackImagePrd.Element.dart';
import 'elements/starAndFavorite.Element.dart';

class BoxProductComponent extends StatefulWidget {
  BoxProductComponent({super.key,this.onTap,required this.prd,this.horizontalType = false,this.onRefresh});
  final ProductModel prd;
  final bool horizontalType;
  final VoidCallback? onTap;
  final Function? onRefresh;
  @override
  State<BoxProductComponent> createState() => _BoxProductComponentState();
}

class _BoxProductComponentState extends State<BoxProductComponent> {
  late Size size;

  int percentSale(){
    double sale = ((widget.prd.priceNew??0)-(widget.prd.priceOld??0))/((widget.prd.priceOld??0)>0?widget.prd.priceOld!:1);
    return (sale*1000).round();
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap??(){},
      child: widget.horizontalType
      ? Container(
        color: AppColor.whiteColor,
        padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital,vertical: 5),
        child: Row(
          children: [
            StackImagePrdElement(prd: widget.prd,width: size.width*.5,),
            const SizedBox(width: 20,),
            Flexible(
              child: _builProductInfo()
            ),         
          ],
        ),
      )
      : Container(
        width: size.width*.45,
        color: AppColor.whiteColor,
        padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital,vertical: 5),
        child: Column(
          children: [
            StackImagePrdElement(prd: widget.prd,height: size.height*.2,width: size.width*.5,),
            Flexible(
              child: _builProductInfo()
            ),         
          ],
        ),
      ),
    );
  }

  Widget _builProductInfo(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text(widget.prd.name??"",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(color: AppColor.darkText,fontSize: 13),
        ),
        const SizedBox(height: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${compactNumberToText(widget.prd.priceNew??0)}đ",
              style: TextStyle(color: AppColor.brightRed,fontSize: 15,fontWeight: FontWeight.w600),
            ),
            Visibility(
              visible: (widget.prd.priceOld??0) > 0,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: AppColor.brightRed,fontSize: 12),
                  children: [
                    TextSpan(text: "${compactNumberToText(widget.prd.priceOld??0)}đ",style: const TextStyle(color: AppColor.darkText,decoration: TextDecoration.lineThrough)),
                    const TextSpan(text:" "),
                    TextSpan(text: "(-${percentSale()}%)")
                  ]
                )
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        StarAndFavoriteElement(
          prd: widget.prd,
          rating: getAvgEvaluate(widget.prd.evaluates?.listEvaluates),
          sizeIcon: AppDatas.sizeStar,
          onRefresh: widget.onRefresh,
        )
      ]
    );
  }
}