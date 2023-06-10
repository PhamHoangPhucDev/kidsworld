// import 'package:dio/dio.dart';
// import 'package:erpcore/configs/activation.Config.dart';
// import 'package:erpcore/configs/app.Config.dart';
// import 'package:erpcore/data/appServiceAPI.Data.dart';
// import 'package:erpcore/models/apps/PrDate.Model.dart';
// import 'package:erpcore/models/apps/appVersion.Model.dart';
// import 'package:erpcore/models/apps/carouselItem.Model.dart';
// import 'package:erpcore/models/apps/notification/notificationInfo.Model.dart';
// import 'package:erpcore/models/apps/prCodeName.Model.dart';
// import 'package:erpcore/models/apps/responses.Model.dart';
// import 'package:erpcore/services/httpClient.dart';
// import 'package:erpcore/utility/app.Utility.dart';
// import 'package:erpcore/utility/logs/appLogs.Utility.dart';
// import 'package:erpcore/utility/preferences.Utility.dart';

// class AppProvider{
//   Dio httpClient = HttpClient.instance.httpClient;
//   AppProvider(){
//   }

//   Future<ResponsesModel> getVersionInfo(String packageName) async{
//     ResponsesModel _result = ResponsesModel.create();
//     try{
//       httpClient.options.receiveTimeout = 30000;//Duration(seconds: 30);
//       httpClient.options.connectTimeout = 10000;//Duration(seconds: 10);
//       httpClient.options.baseUrl = getServerName(true);
//       var responses = await httpClient.post(AppServiceAPIData.checkVersionAppURL,data: {"code":packageName});
//       if(responses.statusCode ==200 && responses.data != null){
//         _result.statusCode =0;
//         _result.msg="";
//         _result.data = AppVersionModel.fromJson(responses.data);
//       }
//       else if(responses.statusCode ==-1){
//         _result.statusCode =1;
//         _result.msg = responses.data.toString();
//       }
//       else if(responses.statusCode ==-2){
//         _result.statusCode =2;
//         _result.msg = responses.data.toString();
//       }
//       else{
//         _result.statusCode =1;
//         _result.msg = "Server error "+responses.statusCode.toString();
//       }
//     }
//     catch(ex){
//       _result.statusCode =1;
//       _result.msg = ex.toString();
//       AppLogsUtils.instance.writeLogs(ex,func: "getVersionInfo app.Provider");
//     }
//     return _result;
//   }

//   Future<ResponsesModel> getAppDomainByPackageName(String packageName) async{
//     ResponsesModel _result = ResponsesModel.create();
//     try{
//       httpClient.options.receiveTimeout = 30000;//Duration(seconds: 30);
//       httpClient.options.connectTimeout = 7000;//Duration(seconds: 10);
//       httpClient.options.baseUrl = getServerName(true);
//       var responses = await httpClient.post(AppServiceAPIData.getAppDomain,data: {"code":packageName});
//       if(responses.statusCode ==200 && responses.data != null){
//         PreferenceUtility.saveString('rootHostURL', responses.data);
//       }
//       else if(responses.statusCode ==-1){
//         _result.statusCode =1;
//         _result.msg = responses.data.toString();
//       }
//       else if(responses.statusCode ==-2){
//         _result.statusCode =2;
//         _result.msg = responses.data.toString();
//       }
//       else{
//         _result.statusCode =1;
//         _result.msg = "Server error "+responses.statusCode.toString();
//       }
//     }
//     catch(ex){
//       _result.statusCode =1;
//       _result.msg = ex.toString();
//       AppLogsUtils.instance.writeLogs(ex,func: "getVersionInfo app.Provider");
//     }
//     return _result;
//   }


//   Future<ResponsesModel> getNewsData() async {
//     ResponsesModel _result = ResponsesModel.create();
//     try {
//       var responses = await httpClient.post(AppServiceAPIData.getListProcessURL, data: {});
//       if (responses.statusCode == 200 && responses.data != null) {
//         if (responses.data["data"] != null) {
//           _result.statusCode = 0;
//           _result.msg = "";
//           _result.data = NotificationInfoModel.fromJsonList(responses.data["data"]);
//         } else {
//           _result.statusCode = 1;
//           _result.msg = responses.data["sysName"];
//         }
//       }
//       else if(responses.statusCode ==-1){
//         _result.statusCode =1;
//         _result.msg = responses.data.toString();
//       } 
//       else {
//         _result.statusCode = 1;
//         _result.msg = "Server error " + responses.statusCode.toString();
//       }
//     } catch (ex) {
//       _result.statusCode = 1;
//       _result.msg = ex.toString();
//       AppLogsUtils.instance.writeLogs(ex,func: "getNewsData app.Provider");
//     }
//     return _result;
//   }

//   Future<ResponsesModel> getCurrentDateTime() async {
//     ResponsesModel _result = ResponsesModel.create();
//     try {
//       var responses = await httpClient.post(AppServiceAPIData.getCurrentDateTimeServer, data: {});
//       if (responses.statusCode == 200 && responses.data != null) {
//         if (responses.data["sysCode"] != null && responses.data["sysCode"]  =="1") {
//           _result.statusCode = 1;
//           _result.msg = responses.data["sysCode"] ;
//         } else {
//           _result.statusCode = 0;
//           _result.data =  PrDate.fromJson(responses.data);
//         }
//       }
//       else if(responses.statusCode ==-1){
//         _result.statusCode =1;
//         _result.msg = responses.data.toString();
//       } 
//       else {
//         _result.statusCode = 1;
//         _result.msg = "Server error " + responses.statusCode.toString();
//       }
//     } catch (ex) {
//       _result.statusCode = 1;
//       _result.msg = ex.toString();
//       AppLogsUtils.instance.writeLogs(ex,func: "getCurrentDateTime app.Provider");
//     }
//     return _result;
//   }

//   Future<ResponsesModel> getAppConfig({required String sysKey}) async {
//     ResponsesModel _result = ResponsesModel.create();
//     try {
//       httpClient.options.receiveTimeout = 10000;//Duration(seconds: 30);
//       httpClient.options.connectTimeout = 5000;//Duration(seconds: 3);
//       httpClient.options.baseUrl = getServerName(true);
//       var responses = await httpClient.post(AppServiceAPIData.getAppConfig, data: {"sysKey": sysKey});
//       if (responses.statusCode == 200 && responses.data != null) {
//         if (responses.data['data'] != null) {
//           _result.statusCode = 0;
//           _result.totalRecord =  responses.data["total"];
//           _result.data = PrCodeName.fromJsonList(responses.data['data']);
//         } else {
//           _result.statusCode = 1;
//           _result.msg = "";
//         }
//       }
//       else if(responses.statusCode ==-1){
//         _result.statusCode =1;
//         _result.msg = responses.data.toString();
//       } 
//       else {
//         _result.statusCode = 1;
//         _result.msg = "Server error " + responses.statusCode.toString();
//       }
//     } catch (ex) {
//       _result.statusCode = 1;
//       _result.msg = ex.toString();
//       AppLogsUtils.instance.writeLogs(ex,func: "getAppConfig app.Provider");
//     }
//     return _result;
//   }

// // lấy danh sách config của module activation
//   Future<ResponsesModel> getProgramConfig({required String sysKey}) async {
//     ResponsesModel _result = ResponsesModel.create();
//     try{
//       httpClient.options.baseUrl = getServerName(true);
//       var responses = await httpClient.post(ActivationConfig.actGetProgramConfig, data: {"sysKey": sysKey});
//       if (responses.statusCode == 200 && responses.data != null) {
//         if (responses.data['data'] != null) {
//           _result.statusCode = 0;
//           _result.totalRecord = responses.data["total"];
//           _result.data = PrCodeName.fromJsonList(responses.data["data"]);
//         } else {
//           _result.statusCode = 1;
//           _result.msg = "";
//         }
//       }
//       else if(responses.statusCode ==-1){
//         _result.statusCode =1;
//         _result.msg = responses.data.toString();
//       } 
//       else {
//         _result.statusCode = 1;
//         _result.msg = "Server error " + responses.statusCode.toString();
//       }
//     }
//     catch(ex){
//       _result.statusCode =1;
//       _result.msg = ex.toString();
//       AppLogsUtils.instance.writeLogs(ex,func: "getProgramConfig app.Provider");
//     }
//     return _result;
//   }
  
//   Future<ResponsesModel> getListAds({String? screenID,String? position}) async {
//     ResponsesModel _result = ResponsesModel.create();
//     try{
//       var responses = await httpClient.post(AppServiceAPIData.getListAds, data: {
//         "pageNumber": 1, 
//         "pageSize": 50, 
//         "PackageID": AppConfig.appPackageName,
//         "ScreenID":screenID,
//         "Position":position 
//       });
//       if (responses.statusCode == 200 && responses.data != null) {
//         if (responses.data['data'] != null) {
//           _result.statusCode = 0;
//           _result.totalRecord =  responses.data["total"];
//           _result.data = CarouselItemModel.fromJsonList(responses.data['data']);
//         } else {
//           _result.statusCode = 1;
//           _result.msg = responses.data["sysName"];
//         }
//       }
//       else if(responses.statusCode ==-1){
//         _result.statusCode =1;
//         _result.msg = responses.data.toString();
//       } 
//       else {
//         _result.statusCode = 1;
//         _result.msg = "Server error " + responses.statusCode.toString();
//       }
//     }
//     catch(ex){
//       _result.statusCode =1;
//       _result.msg = ex.toString();
//       AppLogsUtils.instance.writeLogs(ex,func: "getListAds app.Provider");
//     }
//     return _result;
//   }


// }
