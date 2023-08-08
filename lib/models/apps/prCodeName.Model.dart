class PrCodeName {
  String? code = "";
  String? name = "";
  String? codeDisplay = "";
  String? keyword;
  dynamic value;
  dynamic value2;
  dynamic value3;
  PrCodeName({this.code,this.name,this.codeDisplay,this.keyword,this.value,this.value2,this.value3});

  factory PrCodeName.fromJson(Map<String, dynamic>? json) {
    late PrCodeName result = PrCodeName();
    if (json != null) {
      result = PrCodeName(
        code: (json["code"]) ?? "",
        name: (json["name"]) ?? "",
        codeDisplay: (json["codeDisplay"]) ?? "",
        value: (json["value"])??"",
        value2:(json["value2"])??"",
      );
    }
    return result;
  }

  static bool isEmpty(PrCodeName? item){
    bool result = false;
    try{
      if(item == null){
        result = true;
      }
      else if(item.code == null || (item.code != null && item.code!.isEmpty)){
        result = true;
      }
    }
    catch(ex){
      // AppLogsUtils.instance.writeLogs(ex,func: "isEmpty PrCodeName.Model");
    }
    return result;
  }
  static PrCodeName create() {
    return new PrCodeName(code: "", name: "");
  }

  static List<PrCodeName> fromJsonList(List? list) {
    if (list == null) return [];
    return list.map((item) => PrCodeName.fromJson(item)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<PrCodeName>? list) {
    if (list == null) return [];
    return list.map((item) => item.toJson()).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "code": (this.code) ?? "",
      "name": (this.name) ?? "",
      "codeDisplay": (this.codeDisplay) ?? "",
      "value": (this.value)??"",
      "value2": (this.value2)??""
    };
    return map;
  }

  bool compareTo(PrCodeName? value){
    bool result =false;
    try{
      if(!PrCodeName.isEmpty(value) && (code!.compareTo(value!.code!) ==0)){
        result= true;
      }
    }
    catch(ex){
      // AppLogsUtils.instance.writeLogs(ex,func: "compareTo prCodeName.Model");
    }
    return result;
  }
}
