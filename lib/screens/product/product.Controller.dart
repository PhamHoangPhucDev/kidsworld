import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../blocs/product.Bloc.dart';
import '../../firebase/product.Firebase.dart';
import '../../models/apps/evaluate.Model.dart';
import '../../models/apps/prCodeName.Model.dart';
import '../../models/apps/product.Model.dart';
import '../../utility/app.Utility.dart';
import '../main/main.Controller.dart';

class ProductController extends GetxController {
  static ProductController get initance => Get.find();

  RxBool isLoadingPage = true.obs;
  Rx<ProductModel> itemProduct = ProductModel().obs;
  RxList<ProductModel> listProduct = RxList.empty(growable: true);
  Rx<double> rating = 0.0.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  RxList<PrCodeName> listSearchEvaluate = RxList.empty(growable: true);
  RxList<ListEvaluatesModel> listEvaluate = RxList.empty(growable: true);

  RxString isClick = "".obs;
  late ProductBloc prdBloc;


  @override
  void onInit() {
    prdBloc = ProductBloc(); 
    super.onInit();
  }
  
  @override
  void onReady() async {
    isLoadingPage.value = true;
    await getProductBySyscode();
    searchEvaluate();
    addTextSearchEvaluate();
    isClick.value = listSearchEvaluate[0].code??"";
    isLoadingPage.value = false;
    super.onReady();
  }

  @override
  void refresh() {
    isLoadingPage.value = true;
    isLoadingPage.value = false;
    super.refresh();
  }

  getProductBySyscode() async {
    itemProduct.value = await FireProduct.instance.getProduct(Get.arguments);
  }

  void addTextSearchEvaluate(){
    listSearchEvaluate.clear();
    listSearchEvaluate.addAll([
      PrCodeName(code: "",name: "Xem tất cả đánh giá (${itemProduct.value.evaluates?.listEvaluates?.length??0})"),
      PrCodeName(code: "5",name: "5 sao"),
      PrCodeName(code: "4",name: "4 sao"),
      PrCodeName(code: "3",name: "3 sao"),
      PrCodeName(code: "2",name: "2 sao"),
      PrCodeName(code: "1",name: "1 sao"),
      PrCodeName(code: "image",name: "Có hình ảnh (${0})"),
    ]);
  }

  void searchEvaluate({String star = ""}){
    listEvaluate.clear();
    if (star.isNotEmpty) {
      for (ListEvaluatesModel item in itemProduct.value.evaluates?.listEvaluates??[]) {
        if(item.star != null && item.star!.isNotEmpty && item.star == star){
          listEvaluate.add(item);
        }
      }
    } else {
      listEvaluate.addAll(itemProduct.value.evaluates?.listEvaluates??[]);
    }
    isClick.value = star;
  }

  clickEvaluateStar() async {
    if(rating.value == 0){
      Get.snackbar("Thông báo", "Vui lòng chọn đáng giá");
    } else if(prdBloc.isValid(name: nameController.text,comment :commentController.text)){
      EasyLoading.show(status: 'Loading...');
      (itemProduct.value.evaluates?.listEvaluates??[]).add(
        ListEvaluatesModel(
          commentId: generateKeyCode(),
          userName: nameController.text,
          comment: commentController.text,
          star: "${rating.value.toInt()}",
          date: Timestamp.fromDate(DateTime.now()).toDate(),
        )
      );
      await FireProduct.instance.updateEvaluate(productId: itemProduct.value.sysCode,listEval: itemProduct.value.evaluates?.listEvaluates)
      .then((value){
        Get.back();
        // clearTextAddEval();
        Get.snackbar("Thông báo", "Thành công");
        searchEvaluate(star: isClick.value);
        addTextSearchEvaluate();
        refresh();
      }).catchError((err){

      });
      EasyLoading.dismiss();
    } else {
      addListenerSink();
    }
  }

  clearTextAddEval(){
    rating.value = 0;
    nameController.clear();
    commentController.clear();
  }

  likeComment(ListEvaluatesModel comment) async {
    int? index = itemProduct.value.evaluates?.listEvaluates?.indexOf(comment);
    if(index != null){
      Satisfieds? item = itemProduct.value.evaluates?.listEvaluates?[index].satisfieds;
      if(item != null){
        if(item.listUserId != null && item.listUserId!.isNotEmpty && item.listUserId!.contains(MainController.initance.userData.value.code)){
          item.like = (item.like!) - 1;
          item.listUserId?.removeWhere((e) => e == MainController.initance.userData.value.code);
        } else {
          item.like = (item.like??0) + 1;
          item.listUserId?.add(MainController.initance.userData.value.code);
        }
      } else {
        item = Satisfieds(like: 1,listUserId: [MainController.initance.userData.value.code??""]);
      }
      itemProduct.value.evaluates?.listEvaluates?[index].satisfieds = item;
    }
    await FireProduct.instance.updateEvaluate(productId: itemProduct.value.sysCode,listEval: itemProduct.value.evaluates?.listEvaluates)
    .then((value) => refresh());
  }

  addListenerSink(){
    prdBloc.nameSink.add(nameController.text);
    nameController.addListener(() {
      prdBloc.nameSink.add(nameController.text);
    });
    prdBloc.commentSink.add(commentController.text);
    commentController.addListener(() {
      prdBloc.commentSink.add(commentController.text);
    });
  }
}