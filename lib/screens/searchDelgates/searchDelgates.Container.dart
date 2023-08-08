import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';
import 'package:kidsworld/data/appData.dart';
import 'package:kidsworld/screens/searchDelgates/searchDelgates.Controller.dart';

class SearchDelgatesScreen extends GetWidget<SearchDelgatesController>{
  final SearchDelgatesController searchDelgatesController = Get.find();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Obx(()=> Container(
      color: AppColor.darkText.withOpacity(.1),
      child: Column(
        children: [
          buildLeadingTextSearch(context),
          SizedBox(height: AppDatas.paddingHeight,),
          searchDelgatesController.isLoading.value
            ? buildSuggestedWord():SizedBox()
        ],
      ),
    ));
  }

  Widget buildLeadingTextSearch(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      child: TextField(
        controller: searchDelgatesController.textSearchNamePrd,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Bạn muốn tìm gì cho hôm nay",
          hintStyle: TextStyle(color: AppColor.darkText.withOpacity(.5),fontSize: 14,fontWeight: FontWeight.w700),                
          prefixIcon:  IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,size: 20,),
            onPressed: () {
              searchDelgatesController.clearSuggestedWord();
              Navigator.pop(context);
            } 
          ),
          suffixIcon: Visibility(
            visible: searchDelgatesController.textSearchNamePrd.text.isNotEmpty,
            child: IconButton(
              icon: const Icon(Icons.close,size: 20,),
              onPressed: () => searchDelgatesController.clearSuggestedWord(),
            ),
          ),
        ),
        style: TextStyle(color: AppColor.darkText,fontSize: 14,fontWeight: FontWeight.w700),
        onChanged: (value)=>searchDelgatesController.getSuggestedWord(value),
      ),
    );
  }

  Widget buildSuggestedWord(){
    return Container(
      color: AppColor.whiteColor,
      padding: EdgeInsets.all(AppDatas.marginHorital),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: searchDelgatesController.getSuggestedWord(searchDelgatesController.textSearchNamePrd.text),
      ),
    );
  }
  
}