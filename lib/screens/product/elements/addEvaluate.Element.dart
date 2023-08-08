import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';
import 'package:kidsworld/data/appData.dart';

import '../../../components/boxs/boxStackPositionBottom.Component.dart';
import '../../../components/star/star.Component.dart';
import '../../../components/textField/textFieldDefault.Component.dart';
import '../product.Controller.dart';

class AddEvaluateElement extends StatefulWidget {
  AddEvaluateElement({super.key});

  @override
  State<AddEvaluateElement> createState() => _AddEvaluateElementState();
}

class _AddEvaluateElementState extends State<AddEvaluateElement> {
  @override
  Widget build(BuildContext context) {
    return BoxStackPositionBottomComponent(
      labelPosition: "GỬI ĐÁNH GIÁ",
      onPressPosition: ()=>ProductController.initance.clickEvaluateStar(),     
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital),
        child: Column(
          children: [
            SizedBox(height: AppDatas.paddingHeight,),
            const Text("Viết đánh giá",style: DesignCourseAppTheme.title,),
            SizedBox(height: AppDatas.paddingHeight*2,),
            clickEvaluateStar(),
            SizedBox(height: AppDatas.paddingHeight*2,),
            TextFieldDefaultComponent(
              hintText: "Họ và tên*",
              textController: ProductController.initance.nameController,
              stream: ProductController.initance.prdBloc.nameStream,
            ),
            SizedBox(height: AppDatas.paddingHeight,),
            TextFieldDefaultComponent(
              hintText: "Nhập đánh giá về sản phẩm*",
              line: 3,
              textController: ProductController.initance.commentController,
              stream: ProductController.initance.prdBloc.commentStream,
            ),
          ],
        ),
      ),
    );
  }

  Widget clickEvaluateStar(){
    return Row(
      children: [
        const Text("Chọn đánh giá của bạn",style: DesignCourseAppTheme.font13,),
        const SizedBox(width: 30,),
        StarComponent(size: 25,rating: ProductController.initance.rating.value, onRatingChanged: (rating) => setState(() => ProductController.initance.rating.value = rating),)
      ],
    );
  }
}