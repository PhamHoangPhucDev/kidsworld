class EvaluateModel {
  String? sysCode;
  List<ListEvaluatesModel>? listEvaluates;
  EvaluateModel({this.sysCode,this.listEvaluates});

  factory EvaluateModel.fromJson(Map<String, dynamic>? json) {
    late EvaluateModel result = EvaluateModel();
    if (json != null) {
      result = EvaluateModel(
        sysCode : (json["sysCode"]) ?? "",
        listEvaluates : ListEvaluatesModel.fromJsonList(json["listEvaluates"]),
      );
    }
    return result;
  }

  static List<EvaluateModel> fromJsonList(List? list) {
    if (list == null) return [];
    return list.map((item) => EvaluateModel.fromJson(item)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<EvaluateModel>? list) {
    if (list == null) return [];
    return list.map((item) => item.toJson()).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "sysCode": (sysCode) ?? "",
      "listEvaluates": ListEvaluatesModel.toJsonList(listEvaluates),
    };
    return map;
  }
}

class ListEvaluatesModel {
  String? commentId;
  String? userName;
  String? comment;
  var date;
  String? star;
  Satisfieds? satisfieds;
  ListEvaluatesModel({this.comment,this.star,this.date,this.satisfieds,this.commentId,this.userName});

  factory ListEvaluatesModel.fromJson(Map<String, dynamic>? json) {
    late ListEvaluatesModel result = ListEvaluatesModel();
    if (json != null) {
      result = ListEvaluatesModel(
        commentId : (json["commentId"]) ?? "",
        userName : (json["userName"]) ?? "",
        comment : (json["comment"]) ?? "",
        star : (json["star"]) ?? "",
        date: (json["date"]) ?? DateTime.now(),
        satisfieds: Satisfieds.fromJson(json["satisfieds"])
      );
    }
    return result;
  }

  static List<ListEvaluatesModel> fromJsonList(List? list) {
    if (list == null) return [];
    return list.map((item) => ListEvaluatesModel.fromJson(item)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<ListEvaluatesModel>? list) {
    if (list == null) return [];
    return list.map((item) => item.toJson()).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "commentId": (commentId) ?? "",
      "userName": (userName) ?? "",
      "comment": (comment) ?? "",
      "star": (star) ?? "",
      "date": (date) ?? DateTime.now(),
      "satisfieds": satisfieds?.toJson()
    };
    return map;
  }
}

class Satisfieds {
  List? listUserId;
  int? like;
  Satisfieds({this.listUserId,this.like});

  factory Satisfieds.fromJson(Map<String, dynamic>? json) {
    late Satisfieds result = Satisfieds();
    if (json != null) {
      result = Satisfieds(
        listUserId : (json["listUserId"]) ?? [],
        like : (json["like"]) ?? 0,
      );
    }
    return result;
  }

  static List<Satisfieds> fromJsonList(List? list) {
    if (list == null) return [];
    return list.map((item) => Satisfieds.fromJson(item)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Satisfieds>? list) {
    if (list == null) return [];
    return list.map((item) => item.toJson()).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "listUserId": (listUserId) ?? [],
      "like": (like) ?? 0,
    };
    return map;
  }
}
