import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/appStyle.Config.dart';
import '../../../firebase/product.Firebase.dart';
import '../../../models/apps/product.Model.dart';
import '../../../screens/main/main.Controller.dart';
import '../../star/star.Component.dart';

class StarAndFavoriteElement extends StatefulWidget {
  StarAndFavoriteElement({super.key,required this.prd,required this.sizeIcon,this.sizeDetail = false,this.rating = 5,this.onRefresh});
  final ProductModel prd;
  final double sizeIcon;
  final bool sizeDetail;
  final double rating;
  final Function? onRefresh;
  @override
  State<StarAndFavoriteElement> createState() => _StarAndFavoriteElementState();
}

class _StarAndFavoriteElementState extends State<StarAndFavoriteElement> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    clickFavorite() async {
      await Future.delayed(Duration.zero);
      bool userCheck = widget.prd.favorite?.contains(MainController.initance.userData.value.code)??false;
      if(userCheck) {
        widget.prd.favorite?.removeWhere((e) => e == MainController.initance.userData.value.code);
      } else {
        widget.prd.favorite?.add(MainController.initance.userData.value.code);
      }
      await FireProduct.instance.updateFavorite(productId: widget.prd.sysCode,listEvorite: widget.prd.favorite??[])
      .then((value) {
        
        if(widget.onRefresh!=null){
          return widget.onRefresh!();
        } 
        return setState(() {});
      });
      
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //star
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StarComponent(size: widget.sizeDetail?widget.sizeIcon+5:widget.sizeIcon,rating: widget.rating),
              SizedBox(width: MediaQuery.of(context).size.width*.02,),
              Text("(${(widget.prd.evaluates?.listEvaluates?.length??0)>10000?"10000+":"${widget.prd.evaluates?.listEvaluates?.length.toInt()??0}"}${widget.sizeDetail?' đánh giá':''})",style: TextStyle(color: AppColor.aqua,fontSize: widget.sizeDetail?widget.sizeIcon-5:widget.sizeIcon),),
              // Text("(10000+${sizeDetail?' đánh giá':''})",style: TextStyle(color: AppColor.aqua,fontSize: sizeDetail?sizeIcon-5:sizeIcon),),
            ],
          ),
        ),
        //end star
        //yêu thích
        GestureDetector(
          onTap: clickFavorite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text((widget.prd.favorite?.length??0)>10000?"10000+":"${widget.prd.favorite?.length??0}",style: TextStyle(color: AppColor.aqua,fontSize: widget.sizeDetail?widget.sizeIcon-5:widget.sizeIcon),),
              (widget.prd.favorite?.contains(MainController.initance.userData.value.code)??false)
              ?Icon(Icons.favorite,color: AppColor.brightRed,size: widget.sizeDetail?widget.sizeIcon+5:widget.sizeIcon,)
              :Icon(Icons.favorite_outline_rounded,color: AppColor.aqua,size: widget.sizeDetail?widget.sizeIcon+5:widget.sizeIcon,)
            ],
          ),
        )
        //end yêu thích
      ],
    );
  }
}