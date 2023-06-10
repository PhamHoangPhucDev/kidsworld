class ProductModel {
  String? sysCode;
  String? srcImage;
  String? name;
  String? describe;//mô tả
  String? origin;//xuất xứ
  double? sold;//đã bán
  String? size;//kích thước
  String? color;
  String? paddingSize;//kích thước bao bì
  String? type;//phân loại
  String? sex;//giới tính
  double? priceNew;//giá đã sale
  double? priceOld;//giá cũ
  double? star;//số người đánh giá
  int? favorite;//số người yêu thích
  bool? prdSale;//có sale
  bool? prdHot;//đang hot
  bool? prdGif;//là quà tặng

  ProductModel({this.color,this.describe,this.origin,this.paddingSize,this.sex,this.size,this.sold,this.type,this.prdGif,this.prdHot,this.prdSale,this.sysCode,this.favorite,this.name,this.priceNew,this.priceOld,this.srcImage,this.star});
}