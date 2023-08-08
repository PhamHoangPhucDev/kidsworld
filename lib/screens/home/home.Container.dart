import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/components/boxs/boxCatalog.Component.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';
import 'package:kidsworld/data/appData.dart';
import 'package:kidsworld/routers/app.Router.dart';
import 'package:kidsworld/screens/searchDelgates/searchDelgates.Container.dart';

import '../../components/appBar/appBar.Component.dart';
import '../../components/boxs/boxProduct.Component.dart';
import '../../components/boxs/boxTitle.Component.dart';
import '../../components/skelton/skelton.Component.dart';
import '../../components/viewListItem/girdView.Component.dart';
import '../../components/viewListItem/listView.Component.dart';
import '../../models/apps/product.Model.dart';
import '../main/main.Controller.dart';
import '../searchDelgates/searchDelgates.Controller.dart';
import 'elements/catalogHome.Element.dart';
import 'elements/iconCatalog.Element.dart';
import '../../components/carouselSlider/imgSlider.Component.dart';
import 'home.Controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  final HomeController homeController = Get.find();
  SearchDelgatesController searchDelgatesController = Get.put(SearchDelgatesController());

  late Size size;
  final _scrollController = TrackingScrollController();
  @override
  Widget build(BuildContext context) {

    // searchDelgatesController.context = context;

    size = MediaQuery.of(context).size;
    return Container(
      color: AppColor.darkText.withOpacity(.1),
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Obx(()=> !homeController.isLoadingPage.value 
              ?Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Slider
                  ImageSliderComponent(listSrcImage: homeController.imgList,),
                  //end Slider
                  
                  //Loại
                  CatalogHomeElement(),
                  //end loại
            
                  SizedBox(height: AppDatas.paddingHeight,),
                  //Danh mục
                  BoxCatalogComponent(
                    title: "Danh mục nổi bật",
                    listCatalog: homeController.listCategory.map((e) 
                    => IconCatalog(icon: e.value,colorBackground: e.value2,title: e.name,)
                    ).toList()
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
                        child: ListViewComponent(
                          future: homeController.fireProduct.getAllProducts(),
                          horizontalType: true,
                          onTap: (index,data){
                            Get.toNamed(AppRouter.product,arguments: data[index].sysCode)?.then((value) => homeController.refresh());
                          },
                          onRefresh: homeController.refresh,
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
                        child: 
                          FutureBuilder<List<ProductModel>>(
                            future: homeController.fireProduct.getAllProducts(),
                            builder: (context, snapshot){
                              if(snapshot.hasData){
                                if(snapshot.data != null && snapshot.data!.isNotEmpty){
                                  return BoxProductComponent(
                                    prd: snapshot.data![1],
                                    horizontalType: true,
                                    onTap: ()=>Get.toNamed(AppRouter.product,arguments: snapshot.data![1].sysCode)?.then((value) => homeController.refresh()),
                                    onRefresh: homeController.refresh,
                                  );
                                }
                              } else if(snapshot.hasError) {
                                return Center(child: Text("${snapshot.error.toString()}"),);
                              }
                              return SkeltonComponent(horizontalType: false,itemCount: 1);
                            }
                          ),
                      ),
                      SizedBox(height: AppDatas.paddingWidth,),
                      //list sản phẩm
                      SizedBox(
                        width: size.width,
                        child: GirdViewComponent(
                          future: homeController.fireProduct.getAllProducts(),
                          onTap: (index,data){
                            Get.toNamed(AppRouter.product,arguments: data[index].sysCode)?.then((value) => homeController.refresh());
                          },
                          onRefresh: homeController.refresh,
                        )
                      )
                      //end list sp
                    ],
                  )
                  //end sản phẩm
                ],
              )
              :SizedBox()),
          ),
          AppBarComponent(
            scrollController: _scrollController,
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => SearchDelgatesScreen(),)),
          )
        ],
      )
    );
  }
}
