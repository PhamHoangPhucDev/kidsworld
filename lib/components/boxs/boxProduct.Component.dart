import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';
import 'package:kidsworld/data/appData.dart';
import 'package:kidsworld/models/apps/product.Model.dart';

import '../../routers/app.Router.dart';
import 'elements/stackImagePrd.Element.dart';
import 'elements/starAndFavorite.Element.dart';

class BoxProductComponent extends StatefulWidget {
  BoxProductComponent({super.key,this.onTap,required this.prd,this.horizontalType = false});
  final ProductModel prd;
  final bool horizontalType;
  final VoidCallback? onTap;
  @override
  State<BoxProductComponent> createState() => _BoxProductComponentState();
}

class _BoxProductComponentState extends State<BoxProductComponent> {
  late Size size;

  int percentSale(){
    double sale = ((widget.prd.priceNew??0)-(widget.prd.priceOld??0))/(widget.prd.priceOld??0);
    return (sale*1000).round();
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        if(widget.onTap!=null){
          widget.onTap;
          Get.toNamed(AppRouter.product);
        } 
      },
      child: widget.horizontalType
      ? Container(
        color: AppColor.whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
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
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
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
          style: const TextStyle(color: AppColor.darkText,fontSize: 14),
        ),
        const SizedBox(height: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${widget.prd.priceNew??0}đ",
              style: TextStyle(color: AppColor.brightRed,fontSize: 20,fontWeight: FontWeight.w600),
            ),
            Visibility(
              visible: widget.prd.priceOld!=null,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: AppColor.brightRed,fontSize: 12),
                  children: [
                    TextSpan(text: "${widget.prd.priceOld??0}đ",style: const TextStyle(color: AppColor.darkText,decoration: TextDecoration.lineThrough)),
                    const TextSpan(text:" "),
                    TextSpan(text: "(-${percentSale()}%)")
                  ]
                )
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        StarAndFavoriteElement(prd: widget.prd,sizeIcon: AppDatas.sizeStar,)
      ]
    );
  }
}