
// import 'dart:async';
// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:erpcore/components/alerts/alert.dart';
// import 'package:erpcore/configs/app.Config.dart';
// import 'package:erpcore/configs/appStyle.Config.dart';
// import 'package:erpcore/data/appData.dart';
// import 'package:erpcore/routers/app.Router.dart';
// import 'package:erpcore/services/dioFirebasePerformance.Interceptor.dart';
// import 'package:erpcore/utility/app.Utility.dart';
// import 'package:erpcore/utility/localStorage/permission.dbLocal.dart';
// import 'package:erpcore/utility/logs/appLogs.Utility.dart';
// import 'package:erpcore/utility/preferences.Utility.dart';
// import 'package:get/get.dart' as g;


// class HttpClient {
//   static final HttpClient _singleton = HttpClient._();
//   static HttpClient get instance => _singleton;
//   HttpClient._();
//   String serverURL = "";
  
//   Dio get httpClient {
//     if(serverURL.isEmpty){
//       if([PackageName.heinekenPackage,PackageName.heinekenAuditPackage].contains(AppConfig.appPackageName)){
//         serverURL= getServerName(true,byPackageName: false);
//       }
//       else{
//         serverURL= getServerName(true,byPackageName: true);
//       }
//     }
//     Dio dio = new Dio(setupOptionDio(serverURL));
//     print(dio.options.baseUrl);
//     DioFirebasePerformanceInterceptor dioFirebasePerformanceInterceptor = DioFirebasePerformanceInterceptor();
//     dio.interceptors.add(dioFirebasePerformanceInterceptor);
//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest:(RequestOptions options, RequestInterceptorHandler handler)=> requestInterceptor(options,handler),
//       onResponse: (Response response,ResponseInterceptorHandler handler)=>responseInterceptor(response,handler),
//       onError: (DioError e, handler)=>errorInterceptor(e,handler)
//     ));
//     return dio;
//   }
  

//  Future<dynamic> requestInterceptor( RequestOptions options, RequestInterceptorHandler handler) async
//   {
//     var token = await PreferenceUtility.getString(AppKey.keyERPToken);
//     var infoApp = await initPackageInfo();
//     var fcm_token = await PreferenceUtility.getString(AppKey.keyFcmToken);
//       options.headers["appVersion"] = infoApp.version;
//       options.headers["appPackageName"] = AppConfig.appPackageName;
//       options.headers["deviceOS"] = getPlatform();
//       options.headers["fcm_token"] = fcm_token;
//       // options.headers['Content-Type']="application/json";
//       options.contentType = "application/json";
//     if(token.isNotEmpty){
//       options.headers["Authorization"] = "Bearer " + token;
//     }
//     return handler.next(options);
//   }

//    dynamic responseInterceptor(Response response,ResponseInterceptorHandler handler) async {
//     try{
//       if (response.data!=null && response.data["sysCode"] != null && response.data["sysCode"] == "4") {
//         if (response.data["sysName"]!=null&& response.data["sysName"].toString().contains("syssection")) {
//           Alert.toastShow("Phiên làm việc đã hết hạn, vui lòng đăng nhập lại!",AppColor.brightRed,callback: (){
//             PreferenceUtility.removeByKey(AppKey.keyERPToken);
//               PermissionDBLocal permissionDBLocal = new PermissionDBLocal();
//               permissionDBLocal.removeAllPermission(null);
//             g.Get.offAllNamed(AppRouterModules.signIn);
//           });
//         }
//       }
//     }
//     catch(ex){
//       print("Lỗi http:"+ex.toString());
//       AppLogsUtils.instance.writeLogs(ex,func: "responseInterceptor httpClient");
//     }
//     return handler.next(response); // continue
//   }

//   dynamic errorInterceptor(DioError dioError,ErrorInterceptorHandler handler) async{
//     print( dioError.message);
//     Response temp = Response(statusCode: -2,requestOptions: RequestOptions(path: ''));
//     temp = Response(statusCode: -1,data:_handleError(dioError), requestOptions: RequestOptions(path: ''));
//     return handler.resolve(temp);
//   }

//   BaseOptions setupOptionDio(String serverURL) {
//     return new BaseOptions(
//       baseUrl: serverURL,
//       headers: {
//         "Content-Type": "application/json",
//         "Accept":"*/*",
//         "Access-Control-Allow-Origin": "*",
//         "Connection":"keep-alive"
//       }
//     );
//   }
// }

// String _handleError(DioError dioError) {
//     String result = "Kết nối internet không ổn định, vui lòng thử lại !";
//     try{
//       AppLogsUtils.instance.writeLogs("${jsonEncode(dioError.requestOptions.data)} | ${dioError.error} | ${dioError.requestOptions.baseUrl + dioError.requestOptions.path} | ${jsonEncode(dioError.response?.data)}",func: "_handleError");
//       switch (dioError.type) {
//         case DioErrorType.response:
//           switch (dioError.response!.statusCode){
//             case 404:
//               result= '400 - Not found';
//               break;
//             case 401:
//               result ='401 - Unauthorized.';
//                 Alert.toastShow("Phiên làm việc đã hết hạn, vui lòng đăng nhập lại!",AppColor.brightRed,callback: (){
//                   PreferenceUtility.removeByKey(AppKey.keyERPToken);
//                     PermissionDBLocal permissionDBLocal = new PermissionDBLocal();
//                     permissionDBLocal.removeAllPermission(null);
//                     g.Get.offAllNamed(AppRouterModules.signIn);
//                 });
//               break;
//           }
//           break;
//         case DioErrorType.cancel:
//           result = 'Kết nối bị đóng !';
//           break;
//         case DioErrorType.connectTimeout:
//           result = 'Kết nối internet không ổn định, vui lòng thử lại !';
//           break;
//         case DioErrorType.receiveTimeout:
//           result = 'Kết nối internet không ổn định, vui lòng thử lại !';
//           break;
//         case DioErrorType.sendTimeout:
//           result = 'Kết nối internet không ổn định, vui lòng thử lại !';
//           break;
//         case DioErrorType.other:
//           if ((dioError.message).contains("SocketException")) {
//             result = 'Không có kết nối internet, vui lòng kết nối lại !';
//           }
//           else{
//             result = "Kết nối internet không ổn định, vui lòng thử lại !";
//           }
//           break;
//         default:
//         return 'Kết nối internet không ổn định, vui lòng thử lại !';
//       }
//     }
//     catch(ex){
//       AppLogsUtils.instance.writeLogs(ex,func: "_handleError httpClient");
//     }
//     return result;
//   }
