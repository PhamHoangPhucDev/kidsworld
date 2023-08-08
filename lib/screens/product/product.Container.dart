import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/data/appData.dart';
import 'package:kidsworld/screens/product/product.Controller.dart';

import '../../components/appBar/defaultAppBar.Component.dart';
import '../../components/boxs/boxProduct.Component.dart';
import '../../components/boxs/boxTitle.Component.dart';
import '../../components/skelton/skelton.Component.dart';
import '../../configs/appStyle.Config.dart';
import 'elements/evaluateProduct.Element.dart';
import 'elements/inforProduct.Element.dart';
import 'elements/specProduct.Element.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductController productController = Get.find();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultAppBarComponent(
        leading: true,
        title: "Thông tin sản phẩm",
        actions: [
          InkWell(
            onTap: (){},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(20), // Image radius
                child: Image.network('https://1000logos.net/wp-content/uploads/2021/04/Facebook-logo.png', fit: BoxFit.contain),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.grey.withOpacity(.2),
          child: Obx(() => !productController.isLoadingPage.value
          ?Column(
            children: [
              InforProductElement(),
              SizedBox(height: AppDatas.paddingHeight,),
              //Mô tả sản phẩm
              Container(
                color: AppColor.whiteColor,
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital,vertical: AppDatas.marginVerital),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Mô tả sản phẩm",style: TextStyle(color: AppColor.blackText,fontSize: 18,fontWeight: FontWeight.w600),),
                    SizedBox(height: AppDatas.paddingHeight,),
                    Text(productController.itemProduct.value.describe??""),
                  ],
                ),
              ),
              //end Mô tả
              SizedBox(height: AppDatas.paddingHeight,),
              //Thông số kĩ thuật
              SpecProductElement(),
              //end thông số kĩ thuật
              SizedBox(height: AppDatas.paddingHeight,),
              //Sản phẩm tương tự
              Column(
                children: [
                  //Tiêu đề
                  BoxTitleComponent(
                    title: "Sản phẩm tương tự",
                  ),
                  //end tiêu đề
                  //danh sách sản phẩm
                  SizedBox(
                    width: size.width,
                    height: size.height*AppDatas.ratioHeightPrdColumn,
                    child: productController.isLoadingPage.value
                    ?SkeltonComponent(horizontalType: true,)
                    :ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productController.listProduct.length,
                      itemBuilder: (BuildContext context, index){
                        return Padding(
                          padding: EdgeInsets.only(right: AppDatas.paddingWidth),
                          child: BoxProductComponent(prd: productController.listProduct[index],)
                        );
                      }
                    ),
                  )
                ],
              ),
              //end sản phẩm tương tự
              SizedBox(height: AppDatas.paddingHeight,),
              // Đánh giá
              EvaluateProductElement()
              //end đánh giá
            ],
          )
          :Container(
            color: Colors.transparent,
            height: size.height,
            child: Center(child: const CircularProgressIndicator())
          )),
        ),
      ),
    );
  }
}