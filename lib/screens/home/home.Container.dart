import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/components/boxs/boxCatalog.Component.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';
import 'package:kidsworld/data/appData.dart';

import '../../components/boxs/boxProduct.Component.dart';
import '../../components/boxs/boxTitle.Component.dart';
import '../../components/skelton/skelton.Component.dart';
import '../../routers/app.Router.dart';
import 'elements/iconCatalog.Element.dart';
import '../../components/carouselSlider/imgSlider.Component.dart';
import 'home.Controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  final HomeController homeController = Get.find();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      color: AppColor.darkText.withOpacity(.1),
      child: SingleChildScrollView(
        child: Obx(()=> Column(
          children: [
            //Slider
            ImageSliderComponent(listSrcImage: homeController.imgList,),
            //end Slider
            
            //Loại
            Container(
              width: size.width,
              height: size.height*.15,
              color: AppColor.whiteColor,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GridView(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: size.width,
                  childAspectRatio: size.width/(size.height*.5),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
                ),
                children: [
                    IconCatalog(icon: Icons.dashboard,colorBackground: AppColor.yellow,title: "Danh mục",),
                    IconCatalog(icon: Icons.card_giftcard_outlined,title: "Khuyến mãi",),
                    IconCatalog(icon: Icons.favorite_border_outlined,title: "Hệ thống cửa hàng",),
                    IconCatalog(icon: Icons.child_care_outlined,title: "Thương hiệu nổi bật",),
                    IconCatalog(icon: Icons.headset_mic_outlined,title: "Hỏi đáp",), 
                ],
              ),
            ),
            //end loại
            SizedBox(height: AppDatas.paddingHeight,),
            //Danh mục
            BoxCatalogComponent(
              title: "Danh mục nổi bật",
              listCatalog: [
                IconCatalog(icon: Icons.dashboard,colorBackground: AppColor.yellow,title: "Danh mục",),
                IconCatalog(icon: Icons.card_giftcard_outlined,title: "Khuyến mãi",),
                IconCatalog(icon: Icons.favorite_border_outlined,title: "Hệ thống cửa hàng",),
                IconCatalog(icon: Icons.child_care_outlined,title: "Thương hiệu nổi bật",),
                IconCatalog(icon: Icons.headset_mic_outlined,title: "Hỏi đáp",), 
                IconCatalog(icon: Icons.headset_mic_outlined,title: "Hỏi đáp",), 
              ],
            ),
            //end Danh mục
            SizedBox(height: AppDatas.paddingHeight,),
            //Sản phẩm
            Column(
              children: [
                //Tiêu đề
                BoxTitleComponent(
                  title: "Top sản phẩm bán chạy",
                ),
                //end tiêu đề
                //danh sách sản phẩm
                SizedBox(
                  width: size.width,
                  height: size.height*AppDatas.ratioHeightPrdColumn,
                  child: homeController.isLoadingPage.value
                  ?const SkeltonComponent(horizontalType: true,)
                  :ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.listProduct.length,
                    itemBuilder: (BuildContext context, index){
                      return Padding(
                        padding: EdgeInsets.only(right: AppDatas.paddingWidth),
                        child: BoxProductComponent(prd: homeController.listProduct[index],)
                      );
                    }
                  ),
                )
              ],
            ),
            //end sản phẩm
            SizedBox(height: AppDatas.paddingHeight,),
            //Sản phẩm nổi bật
            Column(
              children: [
                //Tiêu đề
                BoxTitleComponent(
                  title: "Top sản phẩm bán chạy",
                  titleOnTap: "Xem tất cả 20 sản phẩm >>",
                  onTap: (){},
                ),
                //end tiêu đề
                //sản phẩm nổi bật
                SizedBox(
                  width: size.width,
                  height: size.height*AppDatas.ratioHeightPrdRow,
                  child: homeController.isLoadingPage.value
                    ?const SkeltonComponent(horizontalType: false,itemCount: 1)
                    :BoxProductComponent(
                      prd: homeController.listProduct[1],
                      horizontalType: true,
                      onTap: () {},
                    ),
                ),
                SizedBox(height: AppDatas.paddingWidth,),
                //list sản phẩm
                SizedBox(
                  width: size.width,
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3/2,
                      mainAxisExtent: size.height*AppDatas.ratioHeightPrdColumn,
                      crossAxisSpacing: AppDatas.paddingWidth
                    ),
                    itemCount: homeController.listProduct.length,
                    itemBuilder: (ctx,index){
                      return BoxProductComponent(prd: homeController.listProduct[index],);
                    },
                  )
                )
                //end list sp
              ],
            )
            //end sản phẩm
          ],
        ),),
      )
    );
  }
}
