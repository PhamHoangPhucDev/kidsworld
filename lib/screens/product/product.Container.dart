import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/data/appData.dart';
import 'package:kidsworld/screens/product/product.Controller.dart';

import '../../components/boxs/boxProduct.Component.dart';
import '../../components/boxs/boxTitle.Component.dart';
import '../../components/boxs/elements/stackImagePrd.Element.dart';
import '../../components/boxs/elements/starAndFavorite.Element.dart';
import '../../components/skelton/skelton.Component.dart';
import '../../components/star/star.Component.dart';
import '../../configs/appIcon.Config.dart';
import '../../configs/appStyle.Config.dart';

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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.grey.withOpacity(.2),
          child: Column(
            children: [
              Container(
                color: AppColor.whiteColor,
                padding: EdgeInsets.symmetric(horizontal:AppDatas.marginHorital),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StackImagePrdElement(prd: productController.itemProduct.value,height: size.height*.4,width: size.width),
                    Text(productController.itemProduct.value.name??"",style: TextStyle(color: AppColor.blueColor,fontSize: 18,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Thương hiệu: ',
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              const TextSpan(text: 'Moony', style: TextStyle(color: AppColor.nearlyBlue, fontSize: 13)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Mã SP: ',
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(text: productController.itemProduct.value.sysCode??"", style: const TextStyle(color: AppColor.nearlyBlue, fontSize: 13)),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20), // Image border
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(20), // Image radius
                                  child: Image.network('https://1000logos.net/wp-content/uploads/2021/04/Facebook-logo.png', fit: BoxFit.contain),
                                ),
                              ),
                              const Text("Chia sẽ"),
                            ],
                          ),
                        )
                      ],
                    ),
                    StarAndFavoriteElement(prd: productController.itemProduct.value,sizeIcon: 20,sizeDetail: true,),
                    SizedBox(height: AppDatas.paddingHeight,),
                    Container(
                      width: size.width,
                      padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital,vertical: AppDatas.marginVerital),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: AppColor.blackText.withOpacity(.05)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${200.000}đ - ${290.000}đ",style: TextStyle(fontSize: 20,color: AppColor.brightRed,fontWeight: FontWeight.w600),),
                          const Text("${300.000}đ - ${350.000}đ",style: TextStyle(fontSize: 18,color: AppColor.darkText,decoration: TextDecoration.lineThrough)),
                        ],
                      )
                    ),
                    SizedBox(height: AppDatas.paddingHeight,),
                    Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppColor.grey.withOpacity(.5))
                      ),
                      child: ListTile(
                        leading: Image.asset(AppIcons.carShipping_icon),
                        title: const Text("Miễn phí vận chuyển",style: TextStyle(color: AppColor.blackText,fontSize: 18),),
                        subtitle: const Text("Miễn phí vận chuyển cho đơn hàng trên ${150.000}đ"),
                      ),
                    ),
                    const SizedBox(height: 20,)
                  ],
                ),
              ),
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
                    Text("${productController.itemProduct.value.describe}"),
                  ],
                ),
              ),
              //end Mô tả
              SizedBox(height: AppDatas.paddingHeight,),
              //Thông số kĩ thuật
              Container(
                color: AppColor.whiteColor,
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal:AppDatas.marginHorital,vertical: AppDatas.marginVerital),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Thông số kỹ thuật",style: TextStyle(color: AppColor.blackText,fontSize: 18,fontWeight: FontWeight.w600),),
                    Divider(height: 10,color: AppColor.grey.withOpacity(.5),),
                    _buildRowSpaceBetween(title: "SKU",value: "31030131"),
                    _buildRowSpaceBetween(title: "Xuất xứ",value: productController.itemProduct.value.origin??""),
                    _buildRowSpaceBetween(title: "Bán chạy nhất",value: "${productController.itemProduct.value.sold??0}"),
                    _buildRowSpaceBetween(title: "Màu sắc",value: productController.itemProduct.value.color??""),
                    _buildRowSpaceBetween(title: "Kích thước (Bao bì)",value: productController.itemProduct.value.paddingSize??""),
                    _buildRowSpaceBetween(title: "Phân loại",value: productController.itemProduct.value.type??""),
                    _buildRowSpaceBetween(title: "Giới tính",value: productController.itemProduct.value.sex??""),
                    _buildRowSpaceBetween(title: "Size",value: productController.itemProduct.value.size??""),
                  ],
                ),
              ),
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
                    ?const SkeltonComponent(horizontalType: true,)
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
              Column(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppDatas.paddingHeight,),
                          Text("${5} Khách hàng đánh giá",style: DesignCourseAppTheme.font13,),
                          Row(
                            children: [
                              //Leading đánh giá
                              Column(
                                children: [
                                  Text("${5.0}",style: DesignCourseAppTheme.display1,),
                                  SizedBox(height: AppDatas.paddingHeight,),
                                  StarComponent(size: 20,)
                                ],
                              ),
                              //end Leading đánh giá
                              //detail start đánh giá
                              Column(
                                children: [
                                  _buildProgressBar(star: '5',valueStar: 40,totalStar: productController.itemProduct.value.star),
                                  _buildProgressBar(star: '4',valueStar: 10,totalStar: productController.itemProduct.value.star),
                                  _buildProgressBar(star: '3',valueStar: 0,totalStar: productController.itemProduct.value.star),
                                  _buildProgressBar(star: '2',valueStar: 0,totalStar: productController.itemProduct.value.star),
                                  _buildProgressBar(star: '1',valueStar: 0,totalStar: productController.itemProduct.value.star),
                                ],
                              ),
                              //end detail start đánh giá
                            ],
                          ),
                          SizedBox(height: AppDatas.paddingHeight,),
                          //Button write đánh giá
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, spreadRadius: 2),
                              ],
                            ),
                            height: 80,
                            width: size.width,
                            child: GestureDetector(
                              onTap: (){},
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                children: [
                                  _buildTextButtonHover(text: "Xem tất cả đánh giá ${productController.itemProduct.value.star}"),
                                  _buildTextButtonHover(text: "5 sao"),
                                  _buildTextButtonHover(text: "4 sao"),
                                  _buildTextButtonHover(text: "3 sao"),
                                  _buildTextButtonHover(text: "2 sao"),
                                  _buildTextButtonHover(text: "1 sao"),
                                  _buildTextButtonHover(text: "Có hình ảnh (${0})"),
                                ],
                              ),
                              //body filter đánh giá
                              SizedBox(
                                width: size.width,
                                height: size.height*.4,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context,index){
                                    return _buildBodyStart();
                                  }
                                ),
                              ),
                              //end body
                            ],
                          ),
                          // end Filter xem đánh giá theo star
                        ],
                      ),
                    ),
                  )
                  // end Body đánh giá
                ],
              )
              //end đánh giá
            ],
          ),
        ),
      ),
    );

  }

  Widget _buildBodyStart(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Thanh Hoa",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
            SizedBox(width: AppDatas.paddingHeight,),
            StarComponent(size: AppDatas.sizeStar,)
          ],
        ),
        SizedBox(height: AppDatas.paddingHeight,),
        Text(
          "Hàng giao nhanh, đóng gói rất cẩn thận, chất lượng dùng tốt, mình đã mua rất hài lòng với sự phục vụ của shop",
          style: DesignCourseAppTheme.font13,
        ),
        SizedBox(height: AppDatas.paddingHeight,),
        Row(
          children: [
            GestureDetector(
              onTap: (){},
              child: Icon(Icons.thumb_up_alt,size: AppDatas.sizeStar,color: AppColor.grey.withOpacity(.8),),
            ),
            SizedBox(width: AppDatas.paddingHeight,),
            Text("${0} Hài lòng"),
            SizedBox(width: AppDatas.paddingHeight,),
            Text("${DateTime.now()}")
          ],
        ),
        SizedBox(height: AppDatas.paddingHeight,),
      ],
    );
  }

  Widget _buildTextButtonHover({String? text = "",VoidCallback? func}){
    return InkWell(
      onTap: (){
        if(func!=null){
          func;
        }
      },
      child: Container(
        padding: EdgeInsets.all(AppDatas.marginHorital),
        child: Text(text!)
      ),
    );
  }

  Widget _buildProgressBar({required String star,double valueStar = 0,double? totalStar = 1}){
    return Padding(
      padding: EdgeInsets.symmetric(vertical:3.0,horizontal: AppDatas.marginHorital),
      child: Row(
        children: [
          Text(star,style: DesignCourseAppTheme.font13),
          SizedBox(width: AppDatas.marginHorital,),
          const Icon(Icons.star,size: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: AppColor.grey.withOpacity(.2),
            ),
            height: 20,
            width: size.width*.4,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: size.width*(.4*((valueStar<totalStar!?valueStar:totalStar)/totalStar)),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: AppColor.yellow,
                  ),
                ),
              ],
            ),
          ),
          Text("$valueStar Đánh giá",style: DesignCourseAppTheme.font13)
        ],
      ),
    );
  }

  Widget _buildRowSpaceBetween({String title = "",String value = ""}){
    return Column(
      children: [
        const SizedBox(height: 5,),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(title)
            ),
            Expanded(
              flex: 8,
              child: Text(value,textAlign: TextAlign.end,)
            )
          ],
        ),
        const SizedBox(height: 5,),
        Divider(height: 10,color: AppColor.grey.withOpacity(.5),),
      ],
    );
  }
}