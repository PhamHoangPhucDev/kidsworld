import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kidsworld/screens/product/product.Controller.dart';

import '../../../components/boxs/boxTitle.Component.dart';
import '../../../components/modal/modalBottomSheet.Component.dart';
import '../../../components/star/star.Component.dart';
import '../../../configs/appStyle.Config.dart';
import '../../../data/appData.dart';
import '../../../models/apps/evaluate.Model.dart';
import '../../../models/apps/prCodeName.Model.dart';
import '../../../utility/app.Utility.dart';
import '../../main/main.Controller.dart';
import 'addEvaluate.Element.dart';

class EvaluateProductElement extends StatefulWidget {
  EvaluateProductElement({super.key,});
  @override
  State<EvaluateProductElement> createState() => _EvaluateProductElementState();
}

class _EvaluateProductElementState extends State<EvaluateProductElement> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Tiêu đề
        BoxTitleComponent(
          title: "Đánh giá",
        ),
        //end tiêu đề
        //Body đánh giá
        Container(
          color: AppColor.whiteColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital),
            child: FutureBuilder<Object>(
              future: null,
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDatas.paddingHeight,),
                    Text("${ProductController.initance.itemProduct.value.evaluates?.listEvaluates?.length??0} Khách hàng đánh giá",style: DesignCourseAppTheme.font13,),
                    Row(
                      children: [
                        //Leading đánh giá
                        Column(
                          children: [
                            Text("${getAvgEvaluate(ProductController.initance.itemProduct.value.evaluates?.listEvaluates).toStringAsFixed(1)}",style: DesignCourseAppTheme.display1,),
                            SizedBox(height: AppDatas.paddingHeight,),
                            StarComponent(size: 15,rating: getAvgEvaluate(ProductController.initance.itemProduct.value.evaluates?.listEvaluates),)
                          ],
                        ),
                        //end Leading đánh giá
                        //detail start đánh giá
                        Expanded(
                          child: Column(
                            children: [
                              _buildProgressBar(star: '5',valueStar: ProductController.initance.itemProduct.value.evaluates?.listEvaluates?.where((e) => e.star == "5").length??0,totalStar: ProductController.initance.itemProduct.value.evaluates?.listEvaluates?.length??1),
                              _buildProgressBar(star: '4',valueStar: ProductController.initance.itemProduct.value.evaluates?.listEvaluates?.where((e) => e.star == "4").length??0,totalStar: ProductController.initance.itemProduct.value.evaluates?.listEvaluates?.length??1),
                              _buildProgressBar(star: '3',valueStar: ProductController.initance.itemProduct.value.evaluates?.listEvaluates?.where((e) => e.star == "3").length??0,totalStar: ProductController.initance.itemProduct.value.evaluates?.listEvaluates?.length??1),
                              _buildProgressBar(star: '2',valueStar: ProductController.initance.itemProduct.value.evaluates?.listEvaluates?.where((e) => e.star == "2").length??0,totalStar: ProductController.initance.itemProduct.value.evaluates?.listEvaluates?.length??1),
                              _buildProgressBar(star: '1',valueStar: ProductController.initance.itemProduct.value.evaluates?.listEvaluates?.where((e) => e.star == "1").length??0,totalStar: ProductController.initance.itemProduct.value.evaluates?.listEvaluates?.length??1),
                            ],
                          ),
                        ),
                        //end detail start đánh giá
                      ],
                    ),
                    SizedBox(height: AppDatas.paddingHeight,),
                    //Button write đánh giá
                    GestureDetector(
                      onTap: (){
                        Modal.showModalBottomSheetComponent(
                          context: context,
                          height: size.height*.5,
                          child: AddEvaluateElement()
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 2),
                          ],
                        ),
                        height: 80,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.all(AppDatas.paddingHeight),
                          child: const Align(
                            alignment: Alignment.topLeft,
                            child: Text('Để lại đánh giá của bạn',style: DesignCourseAppTheme.font16,)
                          ),
                        ),
                      ),
                    ),
                    //end Button write đánh giá
                    // Filter xem đánh giá theo star
                    Obx(()=>Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: ProductController.initance.listSearchEvaluate.map((e)
                          =>_buildTextButtonHover(
                              item: e,func: (){
                              ProductController.initance.searchEvaluate(star: e.code??"");
                            }),
                        ).toList(),),
                        //body filter đánh giá
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: ProductController.initance.listEvaluate.length,
                          itemBuilder: (context,index){
                            return _buildBodyStart(ProductController.initance.listEvaluate[index]);
                          }
                        ),
                        //end body
                      ],
                    )),
                    // end Filter xem đánh giá theo star
                  ],
                );
              }
            ),
          ),
        )
        // end Body đánh giá
      ],
    );
  }

  Widget _buildBodyStart(ListEvaluatesModel evaluate){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(evaluate.userName??"",style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
            SizedBox(width: AppDatas.paddingHeight,),
            StarComponent(size: AppDatas.sizeStar,starCount: int.parse(evaluate.star??'5'),)
          ],
        ),
        SizedBox(height: AppDatas.paddingHeight,),
        Text(
          evaluate.comment??"",
          style: DesignCourseAppTheme.font13,
        ),
        SizedBox(height: AppDatas.paddingHeight,),
        Row(
          children: [
            GestureDetector(
              onTap: () async{
                await ProductController.initance.likeComment(evaluate);
              },
              child: Icon(
                Icons.thumb_up_alt,
                size: AppDatas.sizeStar,
                color: (evaluate.satisfieds?.listUserId?.contains(MainController.initance.userData.value.code)??false)
                  ?AppColor.blueColor
                  :AppColor.grey.withOpacity(.8)
              ),
            ),
            SizedBox(width: AppDatas.paddingHeight,),
            Text("${evaluate.satisfieds?.like??0} Hài lòng"),
            SizedBox(width: AppDatas.paddingHeight,),
            Text(DateFormat('MM/dd/yyyy, hh:mm a').format(DateTime.fromMicrosecondsSinceEpoch(evaluate.date.microsecondsSinceEpoch)))
          ],
        ),
        SizedBox(height: AppDatas.paddingHeight,),
      ],
    );
  }

  Widget _buildTextButtonHover({PrCodeName? item,VoidCallback? func}){
    TextStyle font14BlueB = TextStyle(color: AppColor.blueColor,fontSize: 14,fontWeight: FontWeight.bold);
    TextStyle font13Blue = const TextStyle(color: AppColor.nearlyBlue,fontSize: 13);
    return InkWell(
      onTap: func??(){},
      child: Container(
        padding: EdgeInsets.all(AppDatas.marginHorital),
        child: Text(
          item?.name??"",
          style: (item?.code??"") == ProductController.initance.isClick.value? font14BlueB : font13Blue,
        )
      ),
    );
  }

  Widget _buildProgressBar({required String star,int valueStar = 0,int? totalStar = 1}){
    return Padding(
      padding: EdgeInsets.symmetric(vertical:3.0,horizontal: AppDatas.marginHorital),
      child: Row(
        children: [
          Text(star,style: DesignCourseAppTheme.font13),
          SizedBox(width: AppDatas.marginHorital,),
          const Icon(Icons.star,size: 15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: AppColor.grey.withOpacity(.2),
            ),
            height: 20,
            width: size.width*.35,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: size.width*(.35*((valueStar<totalStar!?valueStar:totalStar)/(totalStar>0?totalStar:1))),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: AppColor.yellow,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Text("${valueStar.toInt()} Đánh giá",style: DesignCourseAppTheme.font13))
        ],
      ),
    );
  }
}