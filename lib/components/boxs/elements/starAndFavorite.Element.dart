import 'package:flutter/material.dart';
import 'package:kidsworld/data/appData.dart';

import '../../../configs/appStyle.Config.dart';
import '../../../models/apps/product.Model.dart';
import '../../star/star.Component.dart';

class StarAndFavoriteElement extends StatelessWidget {
  StarAndFavoriteElement({super.key,required this.prd,required this.sizeIcon,this.sizeDetail = false});
  final ProductModel prd;
  final double sizeIcon;
  final bool sizeDetail;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //star
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StarComponent(size: sizeDetail?sizeIcon+5:sizeIcon,),
            SizedBox(width: MediaQuery.of(context).size.width*.02,),
            Text("(${prd.star?.toInt()??0}${sizeDetail?' đánh giá':''})",style: TextStyle(color: AppColor.aqua,fontSize: sizeDetail?sizeIcon-5:sizeIcon),),
          ],
        ),
        //end star
        //yêu thích
        GestureDetector(
          onTap: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("${prd.favorite??0}",style: TextStyle(color: AppColor.aqua,fontSize: sizeDetail?sizeIcon-5:sizeIcon),),
              Icon(Icons.favorite_outline_rounded,color: AppColor.aqua,size: sizeDetail?sizeIcon+5:sizeIcon,)
            ],
          ),
        )
        //end yêu thích
      ],
    );
  }
}