import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfoModel {
  String? code;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? token;
  UserInfoModel({this.token,this.phone,this.name,this.code,this.email,this.password});

  factory UserInfoModel.fromJson(Map<String, dynamic>? json) {
    late UserInfoModel result = UserInfoModel();
    if (json != null) {
      result = UserInfoModel(
        code: (json["code"]) ?? "",
        name: (json["name"]) ?? "",
        email: (json["email"]) ?? "",
        password: (json["password"]) ?? "",
        phone: (json["phone"]) ?? "",
        token: (json["token"]) ?? "",
      );
    }
    return result;
  }

  factory UserInfoModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    late UserInfoModel result = UserInfoModel();
    if(data != null){
      result = UserInfoModel(
        code: document.id,
        email: data["email"],
        name: data["name"],
        password: data["password"],
        phone: data["phone"],
      );
    }
    return result;
  }

  static List<UserInfoModel> fromJsonList(List? list) {
    if (list == null) return [];
    return list.map((item) => UserInfoModel.fromJson(item)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<UserInfoModel>? list) {
    if (list == null) return [];
    return list.map((item) => item.toJson()).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "code": (code) ?? "",
      "name": (name) ?? "",
      "email": (email) ?? "",
      "password": (password) ?? "",
      "phone": (phone) ?? "",
      "token": (token) ?? "",
    };
    return map;
  }
}
