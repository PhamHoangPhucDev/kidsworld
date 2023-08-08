import 'evaluate.Model.dart';

class ProductModel {
  String? sysCode;
  List? imagePaths;
  String? name;
  String? describe;//mô tả
  String? origin;//xuất xứ
  int? sold;//đã bán
  String? size;//kích thước
  String? color;
  String? paddingSize;//kích thước bao bì
  String? type;//phân loại
  String? sex;//giới tính
  int? priceNew;//giá đã sale
  int? priceOld;//giá cũ
  List? favorite;//danh sách người yêu thích
  bool? prdHot;//đang hot
  bool? prdGif;//là quà tặng
  EvaluateModel? evaluates;// đánh giá

  ProductModel({this.evaluates,this.color,this.describe,this.origin,this.paddingSize,this.sex,this.size,this.sold,this.type,this.prdGif,this.prdHot,this.sysCode,this.favorite,this.name,this.priceNew,this.priceOld,this.imagePaths,});

  factory ProductModel.fromJson(Map<String, dynamic>? json) {
    late ProductModel result = ProductModel();
    if (json != null) {
      result = ProductModel(
        sysCode : (json["sysCode"]) ?? "",
        imagePaths : (json["imagePaths"]) ?? [],
        name : (json["name"]) ?? "",
        describe : (json["describe"]) ?? "",
        origin : (json["origin"]) ?? "",
        sold : (json["sold"]) ?? 0,
        size : (json["size"]) ?? "",
        color : (json["color"]) ?? "",
        paddingSize : (json["paddingSize"]) ?? "",
        type : (json["type"]) ?? "",
        sex : (json["sex"]) ?? "",
        priceNew : (json["priceNew"]) ?? 0,
        priceOld : (json["priceOld"]) ?? 0,
        favorite : (json["favorite"]) ?? [],
        prdGif: (json["prdGif"]) ?? false,
        prdHot: (json["prdHot"]) ?? false,
      );
    }
    return result;
  }

  static List<ProductModel> fromJsonList(List? list) {
    if (list == null) return [];
    return list.map((item) => ProductModel.fromJson(item)).toList();
  }

  // static List<Map<String, dynamic>> toJsonList(List<ProductModel>? list) {
  //   if (list == null) return [];
  //   return list.map((item) => item.toJson()).toList();
  // }

  // Map<String, dynamic> toJson() {
  //   Map<String, dynamic> map = {
  //     "": () ?? "",
  //   };
  //   return map;
  // }
}