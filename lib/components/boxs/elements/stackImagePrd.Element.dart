import 'package:flutter/material.dart';
import 'package:kidsworld/data/appData.dart';

import '../../../configs/appIcon.Config.dart';
import '../../../configs/appStyle.Config.dart';
import '../../../models/apps/product.Model.dart';
import '../../alert/alert.Component.dart';

class StackImagePrdElement extends StatelessWidget{
  StackImagePrdElement({super.key,this.height,this.width,required this.prd,this.alertImage = false});
  final double? height;
  final double? width;
  final ProductModel prd;
  final bool alertImage;
  @override
  build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: prd.imagePaths!=null
            ?alertImage
              ?Alert.ListPhotoImage(context,imagePaths: prd.imagePaths!)
              :Image.network(
                prd.imagePaths![0],
                fit:BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Image.asset(AppIcons.error_icon,fit: BoxFit.cover,),
              )
            :const Center(child: CircularProgressIndicator())
        ),
        _buildProductType()
      ],
    );
  }

  Widget _buildProductType(){
    return Positioned(
      top: 10,
      right: 0,
      child: Column(
        children: [
          Visibility(
            visible: (prd.priceOld??0) > 0,
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3,color: AppColor.brightRed),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: AppColor.brightRed,
                  ),
                  alignment: Alignment.center,
                  child: Text("Sale",style: TextStyle(color: AppColor.whiteColor,fontSize: 13,fontWeight: FontWeight.w700),),
                ),
                const SizedBox(height: 5,)
              ],
            ),
          ),
          Visibility(
            visible: prd.prdHot??false,
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3,color: AppColor.brightRed),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: AppColor.whiteColor,
                  ),
                  alignment: Alignment.center,
                  child: Text("Hot",style: TextStyle(color: AppColor.brightRed,fontSize: 13,fontWeight: FontWeight.w700),),
                ),
                const SizedBox(height: 5,),
              ],
            ),
          ),
          Visibility(
            visible: prd.prdGif??false,
            child: Container(
              width: 50,
              height: 25,
              decoration: BoxDecoration(
                border: Border.all(width: 3,color: AppColor.brightRed),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: AppColor.brightRed,
              ),
              alignment: Alignment.center,
              child: Icon(Icons.card_giftcard,color: AppColor.whiteColor,size: 14,),
            ),
          ),
        ],
      ),
    );
  }
}