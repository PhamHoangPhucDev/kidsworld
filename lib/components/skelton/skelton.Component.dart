import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';

import '../../data/appData.dart';

class SkeltonComponent extends StatelessWidget {
  SkeltonComponent({super.key,this.horizontalType = false,this.neverPhysic = true,this.itemCount = 5,this.isGridView = false});
  final bool horizontalType;
  final bool neverPhysic;
  final int itemCount;
  final bool isGridView;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget _buildNewCardSkelton(bool type){
      return type
        ?Container(
          color: AppColor.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildItemSkelton(width: size.width*.4,height: size.width*.4),
              const SizedBox(height: 20,),
              _buildItemSkelton(width: size.width*.4,height: 8),
              const SizedBox(height: 5,),
              _buildItemSkelton(width: size.width*.3,height: 8),
              const SizedBox(height: 5,),
              _buildItemSkelton(width: size.width*.2,height: 8),
            ]
          ),
        )
        :Container(
          color: AppColor.whiteColor,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildItemSkelton(width: size.width*.4,height: size.width*.4),
              const SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItemSkelton(width: size.width*.4,height: 15),
                  const SizedBox(height: 20,),
                  _buildItemSkelton(width: size.width*.3,height: 8),
                  const SizedBox(height: 5,),
                  _buildItemSkelton(width: size.width*.25,height: 8),
                  const SizedBox(height: 5,),
                  _buildItemSkelton(width: size.width*.2,height: 8),
                  const SizedBox(height: 5,),
                  _buildItemSkelton(width: size.width*.15,height: 8),
                  const SizedBox(height: 5,),
                  _buildItemSkelton(width: size.width*.1,height: 8),
                ],
              )
            ],
          ),
        )
      ;
    }

    return SizedBox(
      width: size.width,
      height: horizontalType?size.height*AppDatas.ratioHeightPrdColumn:size.height,
      child: isGridView
      ?GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          mainAxisExtent: size.height*AppDatas.ratioHeightPrdColumn,
          crossAxisSpacing: AppDatas.paddingWidth,
          mainAxisSpacing: AppDatas.paddingWidth
        ),
        itemCount: 2,
        itemBuilder: (context, index) => _buildNewCardSkelton(horizontalType),
      )
      :ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: neverPhysic?const NeverScrollableScrollPhysics():const AlwaysScrollableScrollPhysics(),
        scrollDirection: horizontalType?Axis.horizontal:Axis.vertical,
        itemBuilder: (context, index) => _buildNewCardSkelton(horizontalType),
        separatorBuilder: (context, intdex) => horizontalType?const SizedBox(height: 16,):const SizedBox(width: 16,),
        itemCount: itemCount
      ),
    );
  }

  Widget _buildItemSkelton({double? height,width}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColor.blackText.withOpacity(.1),//.04
          borderRadius: const BorderRadius.all(Radius.circular(1))
        ),
      ),
    );
  }
}