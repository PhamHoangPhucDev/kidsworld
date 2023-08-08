import 'package:flutter/material.dart';
import 'package:kidsworld/data/appData.dart';

import '../../../configs/appStyle.Config.dart';
import '../../../models/apps/product.Model.dart';

class ItemShoppingCartElement extends StatefulWidget {
  const ItemShoppingCartElement({super.key,required this.prd});
  final ProductModel prd;
  @override
  State<ItemShoppingCartElement> createState() => _ItemShoppingCartElementState();
}

class _ItemShoppingCartElementState extends State<ItemShoppingCartElement> {
  late Size size;
  int quantity = 1;
  void descQuantity(){
    setState(() {
      if(quantity>1){
        quantity --;
      }
    });
  }
  void ascQuantity(){
    setState(() {
      quantity ++;
    });
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital,vertical: AppDatas.marginVerital),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                widget.prd.imagePaths![0],
                fit: BoxFit.contain,
                height: size.width*.2,
                width: size.width*.2,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.prd.name??"",style: DesignCourseAppTheme.font13,),
                    Text("${widget.prd.priceNew??0}",style: TextStyle(color: AppColor.brightRed,fontSize: 14,fontWeight: FontWeight.w700),)
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildButton(
                    label: "-",
                    onTap: descQuantity,
                    style: TextStyle(color: AppColor.greyOpa,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                  _buildButton(label: "$quantity"),
                  _buildButton(
                    label: "+",
                    onTap: ascQuantity,
                    style: TextStyle(color: AppColor.greyOpa,fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: (){},
              child: Text("Xóa",style: TextStyle(color: AppColor.greyOpa,fontSize: 14,fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({required String label,VoidCallback? onTap,TextStyle? style}){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital/2),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.greyOpa),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Center(child: Text(label,style: style,)),
        ),
      ),
    );
  }
}