import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/apps/evaluate.Model.dart';
import '../models/apps/product.Model.dart';

class FireProduct extends GetxController{
  // static FireProduct get instance => Get.find();
  static FireProduct get instance => Get.put(FireProduct());

  var db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await db.collection("products").get();
    List<ProductModel> listPrdData = snapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    for (ProductModel product in listPrdData) {
      product.evaluates = await getEvaluateByPrdId(product.sysCode);
    }
    return listPrdData;
  }

  Future<ProductModel> getProduct(sysCode) async {
    final snapshot = await db.collection("products").doc(sysCode).get();
    ProductModel prdData = ProductModel.fromJson(snapshot.data());
    prdData.evaluates = await getEvaluateByPrdId(prdData.sysCode);
    return prdData;
  }

  Future<EvaluateModel> getEvaluateByPrdId(productId) async {
    EvaluateModel evaluate = EvaluateModel();
    final snapshot = await db.collection("evaluate").doc(productId).get();
    if(snapshot.exists){
      Map<String, dynamic>? data = snapshot.data();
      evaluate = EvaluateModel.fromJson(data);
    }  
    return evaluate;
  }

  Future<void> updateEvaluate({String? productId,List<ListEvaluatesModel>? listEval}) async {
    await db.collection("evaluate").doc(productId)
    // .set(EvaluateModel(sysCode: productId,listEvaluates: listEval).toJson(),SetOptions(merge: true))
    .update(EvaluateModel(sysCode: productId,listEvaluates: listEval).toJson())
    .onError((e, _) => print("Error writing document: $e"));
  }

  Future<void> updateFavorite({String? productId,List? listEvorite}) async {
    await db.collection("products").doc(productId)
    .update({
      "favorite": listEvorite
    })
    .onError((e, _) => print("Error writing document: $e"));
  }

  Future<List<ProductModel>> getListProductsFavoriteByUser(userId) async {
    final snapshot = await db.collection("products").where("favorite", arrayContains: userId).get();
    List<ProductModel> listPrdData = snapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    for (ProductModel product in listPrdData) {
      product.evaluates = await getEvaluateByPrdId(product.sysCode);
    }
    return listPrdData;
  }
}