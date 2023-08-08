// import 'dart:async';
// import 'dart:convert';

import 'dart:io';
// import 'dart:math';
// import 'package:connectivity/connectivity.dart';
import 'package:device_info_plus/device_info_plus.dart';
// import 'package:erpcore/components/alerts/alert.dart';
// import 'package:erpcore/configs/activation.Config.dart';
// import 'package:erpcore/configs/app.Config.dart';
// import 'package:erpcore/data/appData.dart';
// import 'package:erpcore/data/dateFormatType.Data.dart';
// import 'package:erpcore/data/appServiceAPI.Data.dart';
// import 'package:erpcore/models/activations/ItemSelectDataAct.Model.dart';
// import 'package:erpcore/models/activations/dataImageAct.Model.dart';
// import 'package:erpcore/models/activations/dataTableDynamic/rowDynamic.Model.dart';
// import 'package:erpcore/models/activations/dataTableDynamic/tableDynamic.Model.dart';
// import 'package:erpcore/models/activations/giftAct.Model.dart';
// import 'package:erpcore/models/activations/recordInfo.Model.dart';
// import 'package:erpcore/models/activations/working/WorkingResultAct.Model.dart';
// import 'package:erpcore/models/activations/working/workingAct.Model.dart';
// import 'package:erpcore/models/activations/working/workingDetailAct.Model.dart';
// import 'package:erpcore/models/activations/working/workingPlanAct.Model.dart';
// import 'package:erpcore/models/apps/PrDate.Model.dart';
// import 'package:erpcore/models/apps/PrFileUpload.Model.dart';
// import 'package:erpcore/models/apps/internetConnectionInfo.Model.dart';
// import 'package:erpcore/models/apps/prCodeName.Model.dart';
// import 'package:erpcore/models/apps/responses.Model.dart';
// import 'package:erpcore/models/apps/userInfo.Model.dart';
// import 'package:erpcore/providers/erp/app.Provider.dart';
// import 'package:erpcore/utility/backgroundService/backgroundFunction.Utility.dart';
// import 'package:erpcore/utility/data.Utility.dart';
// import 'package:erpcore/utility/logs/appLogs.Utility.dart';
// import 'package:erpcore/utility/preferences.Utility.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../configs/appStyle.Config.dart';
import '../models/apps/deviceDetail.Model.dart';
import 'logs/appLogs.Utility.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:intl/intl.dart';
// import 'package:package_info/package_info.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:dio/dio.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:record/record.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

// List colors = [Colors.red, Colors.green, Colors.yellow];

// int randomNumber(int size) {
//   Random random = new Random();
//   return random.nextInt(size);
// }

// Color randomColor() {
//   return colors[randomNumber(3)];
// }

  extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    Color result = AppColor.grey;
    try{
      if(hexString != null && hexString.isNotEmpty){
        final buffer = StringBuffer();
        if ((hexString.length == 6 || hexString.length == 7)){
          buffer.write('ff');
        }
        buffer.write(hexString.replaceFirst('#', ''));
        result = Color(int.parse(buffer.toString(), radix: 16));
      }
    }
    catch(ex){
      AppLogsUtils.instance.writeLogs(ex,func: "fromHex app.Utility");
    }
    return result;
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}'
      '${alpha.toRadixString(16).padLeft(2, '0')}';
  }

// Future<PackageInfo> initPackageInfo() async {
//   return await PackageInfo.fromPlatform();
// }

//   Future<String> getDBPath() async {
//     Directory dir;
//     if(Platform.isAndroid){
//       dir = (await getExternalStorageDirectory())!;
//     }
//     else{
//       dir = await getApplicationDocumentsDirectory();
//     }
//     await dir.create(recursive: true);
//     String dbName = "erpLocal.db";
//     var dbPath = join(dir.path,dbName);
//     return dbPath;
//   }

String generateKeyCode() {
  var uuid = Uuid();
  return uuid.v1().toString();
}

// // get extension by path or url
// String checkExtensionFile(String url) {
//   try {
//     return p.extension(url);
//   } catch (ex) {
//     AppLogsUtils.instance.writeLogs(ex,func: "checkExtensionFile app.Utility");
//     return "orther";
//   }
// }

// List<DataImageActModel> removeNullDataImageInList(List<DataImageActModel> data){
//   data.removeWhere((item) => (item.urlImage == "" || item.urlImage == null )&& (item.assetsImage == "" || item.assetsImage == null));
//   return data;
// }

// //
// List<DataImageActModel> cloneListDataImage(List<DataImageActModel> data){
//   return data.map((v) => v).toList();
// }

// List<dynamic> cloneList(List<dynamic> data){
//   return data.map((v) => v).toList();
// }

// bool checkIsNull(List<DataImageActModel> data){
//   var item = data.firstWhere((item) => (item.urlImage == "" || item.urlImage == null )&& (item.assetsImage == "" || item.assetsImage == null),orElse: ()=>DataImageActModel());
//   if(item != null && item.sysCode != null && item.sysCode!.isNotEmpty){
//     return true;
//   }
//   else{
//     return false;
//   }
// }

// // list video extension
// List<String> listVideoExtension = [".3g2",".3gp",".avi",".flv",".h264",".m4v",".mkv",".mov",".mp4",".mpg",".rm",".swf",".vob",".wmv"];
// // kiểm tra video
// bool isVideoCheck(String fileExtension){
//   var result = listVideoExtension.indexOf(fileExtension);
//   if(result>-1){
//     return true;
//   }
//   else{
//     return false;
//   }
// }

// //get File by memory
// Image getFileByMemory(Uint8List byte){
//   return Image.memory(byte);
// }

// String checkFileOrImage(String ext) {
//   const extImage = ["png", "jpeg", "jpg", "gif"];
//   String result = "file";
//   if (extImage.contains(ext.toLowerCase().replaceAll(".", ""))) {
//     result = "image";
//   }
//   return result;
// }

// String formatBytes(int bytes, int decimals) {
//     if (bytes <= 0) return "0 B";
//     const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
//     var i = (log(bytes) / log(1024)).floor();
//     return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +' ' +suffixes[i];
//   }

// // find item in list Object
// int findItemByField(dynamic src, String field, String key) {
//   if (src != null) {
//     for (int i = 0; i < src.length; i++) {
//       if (src[i][field] == key) {
//         return i;
//       }
//     }
//     return -1;
//   }
//   return -1;
// }

// // validate number phone
// bool phoneNumberValidator(String value) {
//   if ((value.length == 10 || value.length == 11) && value[0] == '0') {
//     try {
//       int.tryParse(value);
//       return true;
//     } catch (ex) {
//       AppLogsUtils.instance.writeLogs(ex,func: "phoneNumberValidator app.Utility");
//       return false;
//     }
//   } else {
//     return false;
//   }
// }

// String getPlatform() {
//   try {
//     if (Platform.isAndroid) {
//       return "android";
//     } else if (Platform.isIOS) {
//       return "ios";
//     } else {
//       return "none";
//     }
//   } catch (ex) {
//     AppLogsUtils.instance.writeLogs(ex,func: "getPlatform app.Utility");
//     return "none";
//   }
// }

// String convertImageToBase64(String? path) {
//   if (path != null && path != "") {
//     try {
//       var bytesImg = new File(path);
//       final bytes = bytesImg.readAsBytesSync();
//       String img64 = base64Encode(bytes);
//       return img64;
//     } catch (ex) {
//       AppLogsUtils.instance.writeLogs(ex,func: "convertImageToBase64 app.Utility");
//       return "";
//     }
//   }
//   return "";
// }

// Uint8List imageFromBase64String(String base64String) {
//   Uint8List bytes = base64Decode(base64String);
//   return bytes;
// }

// File getFileByPath(String? path) {
//   late File result;
//   if (path != null && path != "") {
//     try {
//       result = new File(Uri.parse(path).path);
//     } catch (ex) {
//       AppLogsUtils.instance.writeLogs(ex,func: "getFileByPath app.Utility");
//     }
//   }
//   return result;
// }

// get Device Info
Future<DeviceDetailsModel> getDeviceDetails() async {
  DeviceDetailsModel deviceInfo = DeviceDetailsModel();
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      deviceInfo.deviceName = build.model;
      deviceInfo.deviceVersion = build.version.toString();
      deviceInfo.identifier = build.id; //UUID for Android
      deviceInfo.systemName = 'Android';
      deviceInfo.systemVersion = build.version.release;
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      deviceInfo.deviceName = data.name;
      deviceInfo.deviceVersion = data.systemVersion;
      deviceInfo.identifier = data.identifierForVendor; //UUID for iOS
      deviceInfo.systemName = data.systemName;
      deviceInfo.systemVersion = data.systemVersion;
    }
  } on PlatformException {
    print('Failed to get platform version');
  }
  return deviceInfo;
}

// // handle token

// //end

// // check internet connection
// Future<InternetCnInfoModel> checkInternetConnection() async {
//   var result = new InternetCnInfoModel(connectType: "none", connecting: false);
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.mobile) {
//     result.connectType = "mobile";
//     result.connecting = true;
//   } else if (connectivityResult == ConnectivityResult.wifi) {
//     // I am connected to a wifi network.
//     result.connectType = "wifi";
//     result.connecting = true;
//   }
//   return result;
// }

// // handle file to DataFile
// Future<FormData> convertFileToFromData(List<File> listFile, String fileField) async {
//   FormData formData = new FormData();
//   var _list = List<MultipartFile>.empty(growable: false);
//   if (listFile != null && listFile.length > 0) {
//     for (var file in listFile) {
//       _list.add(MultipartFile.fromFileSync(file.path, filename: file.path));
//     }
//     // if(_list.length >0){
//     //   //formData.files.addAll(_list);
//     // }
//     return formData;
//   } else {
//     return formData;
//   }
// }

// // Get location

// Future<ResponsesModel>getLocation() async {
//   var result = ResponsesModel.create();
//   bool serviceEnabled;
//   LocationPermission permission;
//   String msg="";

//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the 
//     // App to enable the location services.
//     msg= "vui lòng mở định vị GPS để tiếp tục";
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       msg= "Vui lòng cho phép ứng dụng quyền sử dụng GPS!";
//     }
//   }
  
//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately. 
//     msg= "Vui lòng cho phép ứng dụng quyền sử dụng GPS!";
//   } 

//   // When we reach here, permissions are granted and we can
//   // continue accessing the position of the device.
//   if(msg.isEmpty){
//     var position = await Geolocator.getCurrentPosition();
//     result.data =position;
//     result.statusCode=0;
//   }
//   else{
//     result.msg = msg;
//     result.statusCode=1;
//   }
//   return result;
// }

// String createPathServer(String? fileUrl, String? fileName) {
//   String result = "";
//   try {
//     String _fileUrl = fileUrl??"";
//     String _fileName = fileName??"";
//     // if(fileUrl !=null && fileUrl.isNotEmpty && (!fileUrl.startsWith("/") && !fileUrl.startsWith("\\"))){
//     //   _fileUrl = fileUrl+"/";
//     // }
//     // if(_fileName.isNotEmpty &&  (_fileName.startsWith("/") && _fileName.startsWith("\\"))){
//     //   _fileName = fileName!.replaceFirst("/", "");
//     // }
//     result = getServerName(false)+"/"+_fileUrl+"/"+_fileName;
//     if (fileUrl != null &&  fileUrl.isNotEmpty) {
//       if (fileUrl.isNotEmpty && (fileUrl.startsWith("https://") || fileUrl.startsWith("http://"))) {
//         result = fileUrl +"/"+ fileName!;
//       }
//     }
//   } catch (ex) {
//     AppLogsUtils.instance.writeLogs(ex,func: "createPathServer app.Utility");
   
//   }
//   return result;
// }

// // get key locastorage
// // String getKeyStorageByType(String type) {
// //   switch (type) {
// //     case "erp":
// //       return AppConfig.keyERPToken;
// //     case "activation":
// //       return AppConfig.keyActivationToken;
// //     default:
// //       return AppConfig.keyERPToken;
// //   }
// // }

// Future<bool> requirePermission(Permission permission) async {
//   try {
//     var status = await permission.status;
//     if (status.isDenied) {
//       var result = await permission.request();
//       if (result.isDenied) {
//         return false;
//       }
//       return true;
//     }
//     return true;
//   } catch (ex) {
//     AppLogsUtils.instance.writeLogs(ex,func: "requirePermission app.Utility");
//     return false;
//   }
// }

// /// // file/ERP/date(yyyy-MM-dd)

// Future<String> getFilePath({String ext = ".png"}) async {
//   String fileName = generateKeyCode() + ext;
//   Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
//   if (Platform.isIOS) {
//     appDocumentsDirectory = await getTemporaryDirectory();
//   } 
//   String appDocumentsPath = appDocumentsDirectory.path; // 2
//   String filePath = appDocumentsPath + "/" + fileName; // 3
//   return filePath;
// }

// Future<void> cleanFileTemp() async {
//   try {
//     Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
//     String appDocumentsPath = appDocumentsDirectory.path; // 2
//     final dir = Directory(appDocumentsPath);
//     dir.deleteSync(recursive: true);
//   } catch (ex) {
//     AppLogsUtils.instance.writeLogs(ex,func: "cleanFileTemp app.Utility");
//   }
// }

// Future<File> getImageFileFromAssets(String path) async {
//   final byteData = await rootBundle.load('assets/$path');
//   final file = File('${(await getTemporaryDirectory()).path}/$path');
//   await file.writeAsBytes(byteData.buffer
//     .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//   return file;
// }

// /// this will delete cache
// Future<void> deleteCacheDir() async {
//   final cacheDir = await getTemporaryDirectory();
//   if (cacheDir.existsSync()) {
//     cacheDir.deleteSync(recursive: true);
//   }
// }

// /// this will delete app's storage
// Future<void> deleteAppDir() async {
//   final appDir = await getApplicationSupportDirectory();
//   if (appDir.existsSync()) {
//     appDir.deleteSync(recursive: true);
//   }
// }

//   Future<String> recordAudio({int status=0,String shopId=""}) async{
//     late String result = "false";
//     bool recordStatus = await Record().hasPermission();
//     if(recordStatus && status ==0){
//       if(!await Record().isRecording() && !await Record().isPaused())
//       {
//         Random dn = new Random();
//         Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
//         String appDocumentsPath = appDocumentsDirectory.path; // 2
//         String filePath = appDocumentsPath + "/${convertDateToInt(date: DateTime.now())}/" + shopId+"_"+convertDateToInt(date: DateTime.now()).toString()+dn.nextInt(5).toString()+".mp4"; // 3
//         Record().start(path: filePath,encoder: AudioEncoder.aacLc);
//         result= "true";
//       }
//       else{
//         Alert.toastShow("Microphone đang được sử dụng, kiểm tra lại", AppColor.brightRed);
//       }
//     }
//     else if(status ==1){
//       result = (await Record().stop())!;
//     }
//     else{
//       Alert.toastShow("Không có quyền ghi âm", AppColor.brightRed);
//     }
//     return result;
//   }

//   Future<dynamic> sendCommandRecordService(String command,{int status=0,String shopId="",bool editPath=true}) async {
//     const platform = const MethodChannel('erp.native/helper');
//     try {
//       if(Platform.isIOS){
//         var result = await recordAudio(status: status,shopId: shopId);
//         if(result == "true"){
//           return "OK";
//         }
//         else if(result == "false"){
//           return null;
//         }
//         else{
//           return result;
//         }
//       }
//       else if(Platform.isAndroid){
//         var result = await platform.invokeMethod(command,{'status':status,'shopId':shopId});
//         if(command == "recordReceiver" && (result == null || result == "")){
//           var pathStorage = await getExternalStorageDirectory();
//           result = (pathStorage!.path)+"/ERP/"+convertDateToInt(date: DateTime.now()).toString()+"/";
//         }
//         else if(command == "recordReceiver" && editPath && (result != null && result != "")){
//           result =result+"/"+ DateFormat('yyyy-MM-dd').format(DateTime.now())+"/";
//         }
//         return result;
//       }
//     } on PlatformException catch (ex) {
//       print(ex);
//       AppLogsUtils.instance.writeLogs(ex,func: "sendCommandRecordService app.Utility");
//       return null;
//     }
//   }
//   Future<double> getFreeStorage() async{
//     double result = -1;
//     try{
//       const platform = const MethodChannel('erp.native/helper');
//       var _temp = await platform.invokeMethod('getFreeStorage');
//       result = double.parse(_temp)/(1000000000);
//     }
//     catch(ex){
//       AppLogsUtils.instance.writeLogs(ex,func: "getFreeStorage");
//     }
//     return result;
//   }

  Future<String> initializationFolder(String folderName) async {
    String path = "";
    Directory? baseDir = await getApplicationSupportDirectory();
    if(Platform.isAndroid){
      baseDir = await getExternalStorageDirectory(); //only for Android
    }
    else{
      baseDir = await getApplicationDocumentsDirectory(); //works for both iOS and Android
    }
    
    if(baseDir != null){
      String dirFarther = await createFolder(baseDir.path,"ERPDATA");
      if(dirFarther.isNotEmpty){
        String dirChilrend = await createFolder(dirFarther,folderName);
        path = dirChilrend;
      }
    }
    return path;
  }

  Future<String> createFolder(String pathSrc,String folderName) async{
    String path ="";
    try{
      if(pathSrc.isNotEmpty){
        String dir = p.join(pathSrc, folderName);
        var dirFolder = Directory(dir);
        bool dirFartherExists = await dirFolder.exists();
        if(!dirFartherExists){
          dirFolder.create(); //pass recursive as true if directory is recursive
        }
        path= dirFolder.path;
      }
    }
    catch(ex){
      AppLogsUtils.instance.writeLogs(ex,func: "createFolder app.Utility");
    }
    return path;
  }
  
// String convertWindowPathToURL(String srcPath) {
//   String result = "";
//   result = srcPath.replaceAll("\\", "/");
//   return result;
// }

// String getFolderPathByFile(String? filePath){
//   String pathFolder ="";
//   try{
//     if(filePath != null){
//       int index =-1;
//       for(var i = filePath.length-1; i>=0;i--){
//         if(filePath[i] == "/"){
//           index = i;
//           break;
//         }
//       }
//       if(index >0){
//         pathFolder = filePath.substring(0,index);
//       }
//     }
//   }
//   catch(ex){
//     AppLogsUtils.instance.writeLogs(ex,func: "getFolderPathByFile app.Utility");
//   }
//   return pathFolder;
// }

// Future<List<FileSystemEntity>> getAllFileInFolder(String pathFolder,{String? sortName}) async{
//   List<FileSystemEntity> folders = new List<FileSystemEntity>.empty(growable: true);
//   try{
//     final myDir = new Directory(pathFolder);
//     var tempFolder = myDir.listSync(recursive: true, followLinks: false);
//     if(sortName != null && sortName.isNotEmpty){
//       folders = tempFolder.where((element) => element.path.contains(sortName)).toList();
//     }
//     else{
//       folders = tempFolder;
//     }
//   }
//   catch(ex){
//     AppLogsUtils.instance.writeLogs(ex,func: "getAllFileInFolder app.Utility");
//   }
//   return folders;
// }

// void onTabChooseDatetion(BuildContext context,{ VoidCallback? onCancel,Function(String)? onConfirm,DateTime? maxTime,DateTime? minTime,DateFormatType type = DateFormatType.DATE}){
//     var _themeConfig = DatePickerTheme(
//       headerColor: Color(0xFF512DA8),
//       itemStyle: TextStyle(
//       color: Colors.grey[600],
//       fontWeight: FontWeight.bold,
//       fontSize: 18),
//       cancelStyle: TextStyle(color: Colors.white, fontSize: 15),
//       doneStyle:TextStyle(color: Colors.white, fontSize: 18)
//     );
//     // xử lý loại input
//     if(type == DateFormatType.DATE){
//       DatePicker.showDatePicker(context,
//         showTitleActions: true,
//         minTime: minTime??DateTime(1900, 0, 0),
//         maxTime: maxTime??DateTime(2100, 0, 0),
//         theme: _themeConfig,
//         onCancel: (){
//           if(onCancel != null)
//             onCancel();
//           },
//           onChanged: (date) {
//             print('change $date in time zone ' +
//             date.timeZoneOffset.inHours.toString());
//           }, 
//           onConfirm: (date) 
//           {
//             var tempDate = DateFormat('yyyy-MM-dd').format(date);
//             if(onConfirm != null){
//               onConfirm(tempDate);
//             }
//           }, 
//           currentTime: DateTime.now(), locale: LocaleType.vi,
//       );
//     }
//     else if(type == DateFormatType.DATETIME){
//       DatePicker.showDateTimePicker(context,
//         showTitleActions: true,
//         minTime: minTime??DateTime(1900, 0, 0),
//         maxTime: maxTime??DateTime(2100, 0, 0),
//         theme: _themeConfig,
//         onCancel: (){
//           if(onCancel != null){
//             onCancel();
//           }
//         },
//         onChanged: (date) {
//           print('change $date in time zone ' +
//           date.timeZoneOffset.inHours.toString());
//         }, 
//         onConfirm: (date) 
//         {
//           var tempDate = DateFormat('yyyy-MM-dd HH:mm').format(date);
//           if(onConfirm != null){
//             onConfirm(tempDate);
//           }
//         }, 
//         currentTime: DateTime.now(), locale: LocaleType.vi,
//       );
//     }
//     else if(type == DateFormatType.TIME){
//       DatePicker.showTimePicker(context,
//         showTitleActions: true,
//         showSecondsColumn: false,
//         theme: _themeConfig,
//         onCancel: (){
//           if(onCancel != null){
//             onCancel();
//           }
//         },
//         onChanged: (date) {
//           print('change $date in time zone ' +
//           date.timeZoneOffset.inHours.toString());
//         }, 
//         onConfirm: (date) 
//         {
//           var tempDate = DateFormat('HH:mm').format(date);
//           if(onConfirm != null){
//             onConfirm(tempDate);
//           }
//         }, 
//         currentTime: DateTime.now(), locale: LocaleType.vi,
//       );
//     }
//   }

//   int convertDateToTicks(DateTime date){
//     const epochTicks = 621356220000000000;
//     int result =0;
//     try{
//      result = date.millisecondsSinceEpoch * 10000 + epochTicks;
//     }
//     catch(ex){
//       AppLogsUtils.instance.writeLogs(ex,func: "convertDateToTicks app.Utility");
//     }
//     return result;
//   }

//   DateTime convertTicksToDate(int ticks){
//     DateTime result = DateTime(DateTime.now().year);
//     const epochTicks = 621356220000000000;
//     try {
//       result =  DateTime.fromMillisecondsSinceEpoch((ticks-epochTicks)~/10000);
//     } 
//     catch (ex) {
//       AppLogsUtils.instance.writeLogs(ex,func: "convertTicksToDate app.Utility");
//     }
//     return result;
//   }

//   extension DateOnlyCompare on DateTime {
//     bool isSameDate(DateTime other) {
//     return year == other.year && month == other.month && day == other.day;
//     }
//   }

//     // định dạng thời gian
//   String datetimeDisplayHandle({String formatDate ="yyyy-MM-dd HH:mm",String? dateTimeStringInput,DateTime? dateTimeInput}){
//     String result ="n.a";
//     try{
//       final format = new DateFormat(formatDate);
//       if(dateTimeStringInput != null  && dateTimeStringInput.isNotEmpty){
//           result =format.format(DateTime.parse(dateTimeStringInput));
//       }
//       else if(dateTimeInput != null){
//         result =format.format(dateTimeInput);
//       }
//     }
//     catch(ex){
//       AppLogsUtils.instance.writeLogs(ex,func: "datetimeDisplayHandle app.Utility");
//     }
//     return result;
//   }

  int convertDateToInt({String? dateString,DateTime? date}){
    int result=0;
    try{
      if(dateString != null){
        if(dateString != null && dateString.isNotEmpty){
          var _date = DateTime.parse(dateString);
          result = int.parse(DateFormat('yyyyMMdd').format(_date));
        }
      }
      else if(date != null){
        result = int.parse( DateFormat('yyyyMMdd').format(date));
      }
    }
    catch(ex){
      AppLogsUtils.instance.writeLogs(ex,func: "convertDateToInt app.Utility");
    }
    return result;
  }

//   String convertIntToDate(String date) {
//     String result ="";
//     try{
//       var _data = date.toString();
//       String year = _data.substring(0, 4);
//       String month = _data.substring(4, 6);
//       String day = _data.substring(6, 8);
//       result = year + "-" + month + "-" + day;
//     }
//     catch(ex){
//       AppLogsUtils.instance.writeLogs(ex,func: "convertIntToDate app.Utility");
//     }
//     return result;
//   }

//   String formatTime(int seconds) {
//     return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
//   }

//   Future<bool> internetConnectionChecking()async{
//     bool result = false;
//     try {
//       final onlineResult = await InternetAddress.lookup('google.com');
//       if (onlineResult.isNotEmpty && onlineResult[0].rawAddress.isNotEmpty) {
//         result = true;
//       }
//     } on SocketException catch (ex) {
//       AppLogsUtils.instance.writeLogs(ex,func: "onlineChecking app.Utility");
//       result = false;
//     }
//     return result;
//   }
  
//   Future<File> moveFile(File sourceFile, String newPath) async {
//     File result = sourceFile;
//     try {
//     // prefer using rename as it is probably faster
//     //await File(Uri.parse(newPath).path).create(recursive: true);
//     result = await sourceFile.rename(newPath);
//     } on FileSystemException catch (e) {
//     AppLogsUtils.instance.writeLogs(e,func: "moveFile");
//     // if rename fails, copy the source file and then delete it
//     final newFile = await sourceFile.copy(newPath);
//     await sourceFile.delete();
//     result= newFile;
//   }
//     return result;
//   }

  String getUnitNumber(dynamic number) {
    String result = "";
    try {
      // String numberOfText = ((number as double).toInt()).toString();
      String numberOfText = (number).toString();
      switch (numberOfText.length) {
        case 6:
          result = "trăm";
          break;
        case 7:
          result = "tr";
          break;
        case 8:
          result = "tr";
          break;
        case 9:
          result = "tr";
          break;
        case 10:
          result = "tỷ";
          break;
        case 11:
          result = "tỷ";
          break;
        case 12:
          result = "tỷ";
          break;
        case 13:
          result = "tỷ";
          break;
        case 14:
          result = "tỷ";
          break;
      }
    } catch (ex) {
      print(ex);
      AppLogsUtils.instance.writeLogs(ex,func: "getUnitNumber app.Utility");
    }
    return result;
  }

  String compactNumberToText(dynamic number) {
    String result = "0";
    try {
      int divisor = 1;
      // int length = ((number as double).toInt()).toString().length;
      int length = (number).toString().length;
      if (length <= 6) {
        divisor = 1000;//00
      } else if (6 < length && length < 10) {
        divisor = 10000;//00
      } else if (9 < length) {
        divisor = 10000000;//00
      }
      result = (number / divisor).toStringAsFixed(3);
    } catch (ex) {
      AppLogsUtils.instance.writeLogs(ex,func: "compactNumberToText app.Utility");
    }
    return result;
  }

//   // nếu type = true --> trả về url có gắn api và ngược lại
//   String getServerName(bool type,{bool byPackageName=false}){
//     String result = AppServiceAPIData.acaHostURL;
//     try{
//       if(byPackageName){
//         var temp = PreferenceUtility.getString("rootHostURL");
//         if(temp.isNotEmpty){
//           result = temp;
//         }
//       }
//       else{
//         if(AppConfig.appPackageName == PackageName.acacyPackage){
//           result = AppServiceAPIData.acaHostURL;
//         }
//         else if(AppConfig.appPackageName == PackageName.spiralPackage || AppConfig.appPackageName == PackageName.spiralv2Package){
//           result = AppServiceAPIData.spiHostURL;
//         }
//         else if(AppConfig.appPackageName == PackageName.heinekenAuditPackage || AppConfig.appPackageName == PackageName.heinekenPackage){
//           result = AppServiceAPIData.heinekenHostURL;
//           //result = "https://heineken.acacy.com.vn/";
//         }
//       }
//     }
//     catch(ex){
//       AppLogsUtils.instance.writeLogs(ex,func: "getServerName app.Utility");
//     }

//     if(type){
//       //return "https://smallbrushedpencil44.conveyor.cloud/api";//result+"api";
//       return result+"api";
//     }
//     else{
//       return result;
//     } 
//   }
  
// Future<bool> updateRecordStatus(RecordInfoModel value) async {
//   var temp = jsonEncode(value.toJson());
//   return PreferenceUtility.saveString(ActivationConfig.actRecordKey, temp);
// }

// Future<RecordInfoModel> getRecordStatus() async {
//   var result = RecordInfoModel(workingPlanCode: "",createdAt: DateTime.now(),status: false,shopName: "");
//   try{
//     var temp = PreferenceUtility.getString(ActivationConfig.actRecordKey);
//     var resultJson = jsonDecode(temp);
//     result = RecordInfoModel.fromJson(resultJson);
//   }
//   catch(ex){
//     AppLogsUtils.instance.writeLogs(ex,func: "getRecordStatus appUtils");
//   }
//   return result;
// }

// List<DataImageActModel> mergeImageData(List<DataImageActModel> localData,List<DataImageActModel> networkData, int maxSize,{bool isRemoveAssetFile=false}) {
//   if(isRemoveAssetFile && (localData != null && localData.isNotEmpty) ){
//     //localData.removeWhere((element) => (element.assetsImage != null && element.assetsImage.isNotEmpty && element.urlImage.isEmpty));
//     networkData.removeWhere((element) => (element.assetsImage != null && element.assetsImage!.isNotEmpty && (element.urlImage == null || element.urlImage!.isEmpty)));
//   }
//   if (networkData == null || networkData.length <= 0) {
//       if(networkData == null){
//         localData = new List<DataImageActModel>.empty(growable: true);
//       }
//       if(localData.length ==0){
//         //localData.add(new DataImageActModel(sysCode: generateKeyCode(), createdAt: new PrDate()));
//         localData.insert(0,new DataImageActModel(sysCode: generateKeyCode(), createdAt: new PrDate()));
//       }
//     return localData; // nếu dữ liệu netWork rỗng --> đẩy dữ liệu local
//   } else {
    
//     var _temData = networkData.map((v) => v).toList();
//     //_temData= removeNullDataImageInList(_temData);
//     _temData.sort((a, b) => a.createdAt!.lD!.compareTo((b.createdAt!.lD)!));
   
//     if(checkIsNull(_temData)){
//       return _temData;
//     }
//     else if(maxSize>0 && (_temData.length >= maxSize)){
//       _temData = removeNullDataImageInList(_temData);
//     }
//     else{
//       _temData.insert(0,new DataImageActModel(sysCode: generateKeyCode(), createdAt: new PrDate()));
//     }
//     return _temData;
//   }
// }

// List<DataImageActModel> mergeAudioData(List<DataImageActModel> localData,bool removeAssetsItem) {
//  if(localData == null){
//   localData = new List<DataImageActModel>.empty(growable: true);
//  }
//  else if(removeAssetsItem){
//    localData.removeWhere((element) => (element.assetsImage != null && element.assetsImage!.isNotEmpty && (element.urlImage == null ||element.urlImage!.isEmpty)));
//  }
//  return localData;
// }

// List<ItemSelectDataActModel> mergeSelectData(List<ItemSelectDataActModel>? selectResult,List<ItemSelectDataActModel>? selectSrc) {
 
//   List<ItemSelectDataActModel> result = List<ItemSelectDataActModel>.empty(growable: true);
//   try{
//     if(selectSrc == null){
//       selectSrc = new List<ItemSelectDataActModel>.empty(growable: true);
//     }
//     if(selectResult == null){
//       selectResult = new List<ItemSelectDataActModel>.empty(growable: true);
//     }
//     for(var item in selectSrc){
//       var _temp = selectResult.indexWhere((e)=> e.code?.compareTo(item.code??"")==0);
//       if(_temp>-1){
//         item.isChoose = selectResult[_temp].isChoose;
//       }
//       result.add(item);
//     }
//   }
//   catch(ex){
//     AppLogsUtils.instance.writeLogs(ex,func: "mergeSelectData app.Utility");
//   }
//   return result;
// }

// // // Xáo trộ các phần quà
// List<GiftActModel> randomizeGift(List<GiftActModel> giftSrc,int length){
//   if(giftSrc != null && giftSrc.length <1){
//     return [];
//   }
//   else
//   {
//     var _temp = giftSrc.map((v) => v).toList();
//     int _tempLength = giftSrc.length;
//     while(_tempLength <length)
//     {
//       _temp.add(giftSrc[randomNumber(giftSrc.length)]);
//       _tempLength++;
//     }
//     return _temp;
//   }
// }

// Future<String> checkRequireWorkDetail(WorkingDetailActModel item,{bool flag = false}) async{
//   String msg= "";
//   BackgroundFunctionUtils backgroundFunctionUtils = BackgroundFunctionUtils();
//   try{
//     if(item.enable){
//       if(item.isImage != null && item.isImage!.enable != null && item.isImage!.enable && (item.isImage!.isRequire??false)){
//         int length = item.workingResult!.imageData!.where((element) => ((element.assetsImage != null &&  element.assetsImage != "") || (element.urlImage != null &&  element.urlImage != ""))).length;
//         if(length<=0){
//           msg+= "Chưa hoàn thành ${item.name} \n";
//         }
//         else{
//           if(((item.isImage!.minQuantity??0) > length)){
//             msg+="${item.name} số lượng hình ảnh tối thiểu là "+(item.isImage!.minQuantity==0?1:item.isImage!.minQuantity).toString()+"\n";
//           }
//         }
//       }
//       if(item.isVideo !=null && item.isVideo!.enable && item.isVideo!.enable !=null && (item.isVideo!.isRequire??false)){
//         int length = item.workingResult!.videoData!.where((element) => ((element.assetsImage != null &&  element.assetsImage != "") || (element.urlImage != null &&  element.urlImage != ""))).length;
//         if(length<=0){
//           msg+= "Chưa hoàn thành ${item.name} \n";
//         }
//         else{
//           if(((item.isVideo!.minQuantity??0) > length)){
//             msg+="${item.name} số lượng video tối thiểu là "+(item.isVideo!.minQuantity??0).toString()+"\n";
//           }
//         }
//       }
//       if(item.isRecord !=null && item.isRecord!.enable != null && item.isRecord!.enable && (item.isRecord!.isRequire??false)){
//         int length = item.workingResult!.recordData!.where((element) => ((element.assetsImage != null &&  element.assetsImage != "") || (element.urlImage != null &&  element.urlImage != ""))).length;
//         if(length<=0){
//           msg+= "Chưa hoàn thành ${item.name} \n";
//         }
//         else{
//           if(((item.isRecord!.minQuantity??0) > length)){
//             msg+="Số lượng ghi âm tối thiểu là "+(item.isRecord!.minQuantity??0).toString()+"\n";
//           }
//         }
//       }
//       if(item.isText!.enable != null && item.isText!.enable && (item.isText!.isRequire??false) && (item.txtInput!.text.isEmpty)){
//         msg+= (item.isText!.name != null && item.isText!.name.isNotEmpty)?item.isText!.name:(item.name??"Dữ liệu")+" không được bỏ trống!\n";
//       }
//       if(item.isNumber!.enable != null && item.isNumber!.enable && (item.isNumber!.isRequire??false) && item.numberInput!.text.isEmpty){
//         msg+= (item.isNumber!.name != null && item.isNumber!.name.isNotEmpty)?item.isNumber!.name:(item.name??"Dữ liệu ")+" không được bỏ trống!\n";
//       }
//       if(item.isDate!.enable != null && item.isDate!.enable && (item.isDate!.isRequire??false) && item.dateInput!.text.isEmpty)
//       {
//         msg+= (item.isDate!.name.isNotEmpty?item.isDate!.name:"Dữ liệu ")+" không được bỏ trống!\n";
//       }
//       if(item.isText!.enable !=null && item.isText!.enable && (item.isText!.verifyData != null && item.isText!.verifyData! >0) && (item.workingResult?.verified ==null || (item.workingResult?.verified !=null && item.workingResult!.verified == false))){
//         msg+= (item.isText!.name.isNotEmpty?item.isText!.name:"Dữ liệu ")+" chưa được xác thực!\n";
//       }
//       if(item.isNumber!.enable !=null && item.isNumber!.enable && (item.isNumber!.verifyData != null && item.isNumber!.verifyData! >0) && (item.workingResult?.verified ==null || (item.workingResult?.verified !=null && item.workingResult!.verified == false))){
//         msg+= (item.isNumber!.name.isNotEmpty?item.isNumber!.name:"Dữ liệu ")+" chưa được xác thực!\n";
//       }
//       if(item.isSelectBox != null && (item.isSelectBox!.enable??false) && (item.isSelectBox!.isRequired??false) && (item.workingResult?.selectedItems == null || (item.workingResult?.selectedItems != null && item.workingResult!.selectedItems!.isEmpty))){
//         msg+= "+ ${item.isSelectBox?.lable??"Dữ liệu chọn"} không được bỏ trống\n";
//       }
//       // kiểm tra lựa chọn radio button
//       if(item.radioRequire && !validateMultiplechoice(item.srcData??[],true)){
//         msg+= "${item.name} phải chọn 1 đáp án \n";
//       }
//       // kiểm tra lựa chọn radio button
//       if(item.checkboxRequire && !validateMultiplechoice(item.srcData??[],false)){
//         msg+= "${item.name} phải chọn tối thiểu 1 đáp án \n";
//       }
//       var fn_checking  = await DataUtility.getConfigByKey("fnValidateDynamicTableRowInputData");
//       if(fn_checking.isNotEmpty && File(fn_checking).existsSync()){
//         var _resultRowChecked = await backgroundFunctionUtils.tableDynamicValidateRowData((item.workingResult!.tableData != null && item.workingResult!.tableData!.rows != null)?(item.workingResult!.tableData?.rows)!:[]);
//         if(_resultRowChecked.statusCode == 1){
//           msg+= _resultRowChecked.msg??"";
//         }
//       }
//     }
//   }
//   catch(ex){
//     msg+="Có lỗi xảy ra trong quá trình kiểm tra dữ liệu \n ("+ex.toString()+")";
//     AppLogsUtils.instance.writeLogs(ex,func: "checkRequireWorkDetail app.Utility");
//   }
//   return msg;
// }

// bool itemCorrectChecking(List<ItemSelectDataActModel> data){
//   bool result = false;
//   try{
//     var index = data.indexWhere((element) => element.isChoose == true && element.point ==1 && element.isChoose==true);
//     if(index >=0){
//       result =true;
//     }
//   }
//   catch(ex){}
//   return result;
// }

// bool validateMultiplechoice(List<ItemSelectDataActModel> data, bool chooseType){
//   // chooseType == false = checkbox
//   bool result = false;
//   try{
//     var tempData = data.where((element) => element.isChoose==true && element.visibility && element.selectType == chooseType).toList();
//     if(tempData.length >0){
//       result= true;
//     }
//   }
//   catch(ex){
//     AppLogsUtils.instance.writeLogs(ex,func: "validateMultiplechoice");
//   }
//   return result;
// }

// void setDataBeforeSave(WorkingDetailActModel item,WorkingActModel working,WorkingPlanActModel workingPlan){
//     if(item.workingResult == null) item.workingResult =  WorkingResultActModel.create();
//     try{
//       item.workingResult!.workDetail =  new PrCodeName(code: item.code,name:"");
//       var wpSelected = workingPlan;
//       var wkSelected = working;
//       item.workingResult?.workplace = new PrCodeName(code: wpSelected.sysCode, name: "");
//       item.workingResult?.workingDay = wpSelected.workingDay;
//       item.workingResult!.workDetailCode = item.code;
//       item.workingResult?.workingPlanCode = workingPlan.sysCode;
//       item.workingResult?.workingCode = working.code;
//       item.workingResult?.work = new PrCodeName(code: wkSelected.code, name: wkSelected.name);
//       //item.workingResult.codeGroup = generateKeyCode();
//       item.workingResult?.dateData =  item.dateInput?.text;
//       item.workingResult?.textData =  item.txtInput?.text;
//       item.workingResult?.verified =  item.workingResult?.verified??false;
//       int _numberdata = 0;
//       try{
//         _numberdata = int.parse(item.numberInput!.text);
//       }
//       catch(ex){
//         AppLogsUtils.instance.writeLogs("${ex} | ${item.numberInput!.text}",func: "setDataBeforeSave app.Utility");
//         _numberdata = 0;
//       }
//       item.workingResult?.numberData =  _numberdata;
//       if(item.workingResult?.itemSelected == null){
//         item.workingResult?.itemSelected = new List<ItemSelectDataActModel>.empty(growable: true);
//       }
//       item.workingResult!.itemSelected = item.srcData;
      
//       // xử lý dữ liệu dynamic table
//       if(item.workingResult?.tableData == null){
//         item.workingResult?.tableData = TableDynamicModel();
//       }
//       if((item.isScan?.enable??false) == false){
//         item.workingResult!.tableData = item.isDynamicTable;
//       }

//       // xử lý dữ liệu select Box
//       if(item.workingResult?.selectedItems == null){
//         item.workingResult?.selectedItems = new List<PrCodeName>.empty(growable: true);
//       }

//       if(PrDate.isEmpty(item.workingResult?.createDate)){
//         item.workingResult?.createDate = PrDate.setDate(DateTime.now());
//       }
//       item.workingResult?.updatedAt = PrDate.setDate(DateTime.now());
//     }
//     catch(ex){
//       AppLogsUtils.instance.writeLogs(ex,func: "setDataBeforeSave app.Utility");
//       throw ex;
//     }
//   }

//   WorkingDetailActModel loadDataForUI(WorkingResultActModel data,WorkingDetailActModel item){
//     // set field interface
//       if(item.txtInput?.text != null && item.txtInput!.text.isEmpty){
//         item.txtInput?.text = data.textData??"";
//       }
//       if(item.numberInput?.text != null && item.numberInput!.text.isEmpty){
//         item.numberInput?.text = ( data.numberData??"").toString();
//       }

//       if(item.dateInput?.text != null && item.dateInput!.text.isEmpty){
//         item.dateInput?.text = (data.dateData??"").toString();
//       }
      
//       // set field temp work result
//       item.workingResult?.imageData = mergeImageData((item.workingResult?.imageData??[]), data.imageData??[],(item.isImage?.maxQuantity)!,);
//       item.workingResult?.imageBillData = mergeImageData((item.workingResult?.imageBillData)??[],(data.imageBillData)??[],(item.isImage?.maxQuantity)!);
//       item.workingResult?.videoData = mergeImageData((item.workingResult?.videoData)??[], data.videoData??[],(item.isVideo?.maxQuantity)!);
//       item.workingResult?.recordData = mergeAudioData((data.recordData)??[],false);
//       item.srcData = mergeSelectData((data.itemSelected),item.srcData);
//       item.workingResult?.codeGroup = data.codeGroup;
//       item.workingResult?.sysCode = data.sysCode;
//       item.workingResult?.localCode = data.localCode;
//       item.workingResult?.privateKey = data.privateKey;
//       item.workingResult?.updatedAt = data.updatedAt;
//       item.workingResult?.dateData = data.dateData;
//       item.workingResult?.isEdit = data.isEdit;
//       item.workingResult?.itemSelected = data.itemSelected;
//       item.workingResult?.latitude = data.latitude;
//       item.workingResult?.localCode = data.localCode;
//       item.workingResult?.latitude = data.latitude;
//       item.workingResult?.syncDatedAt = data.syncDatedAt;
//       item.workingResult?.numberData = data.numberData;
//       item.workingResult?.verified = data.verified??false;
//       item.workingResult?.textData = data.textData;
//       item.workingResult?.work = data.work;
//       item.workingResult?.workDetail = data.workDetail;
//       item.workingResult?.workDetailCode = data.workDetailCode;
//       item.workingResult?.workingCode = data.workingCode;
//       item.workingResult?.workingDay = data.workingDay;
//       item.workingResult?.workingPlan = data.workingPlan;
//       item.workingResult?.workingPlanCode = data.workingPlanCode;
//       item.workingResult?.workplace = data.workplace;

//       if(item.workingResult?.tableData == null){
//         item.workingResult?.tableData = TableDynamicModel();
//         item.workingResult?.tableData?.rows = new List<RowsDynamicModel>.empty(growable: true);
//       }
//       item.workingResult!.tableData = item.isDynamicTable;
//       if(data.tableData?.rows != null && data.tableData!.rows!.isNotEmpty){
//         item.workingResult!.tableData?.rows = data.tableData?.rows;
//       }
//       // set dữ liệu cho select Box
//       if(item.workingResult?.selectedItems == null){
//         item.workingResult?.selectedItems = List<PrCodeName>.empty(growable: true);
//       }
//       item.workingResult?.selectedItems = data.selectedItems;
//       return item;
//   }

// List<DataImageActModel> handleImageDataCallback(List<DataImageActModel> data, String path, String sysCode){
//   List<DataImageActModel> result = List<DataImageActModel>.empty(growable: true);
//   for(int i=0;i<data.length;i++){
//     if(data[i].sysCode == sysCode){
//       data[i].assetsImage = path;
//       break;
//     }
//   }
//   result = data;
//   return result;
// }

// // xử lý file khi lưu offline 
// Future<List<DataImageActModel>> handleFileOffile(List<DataImageActModel> src) async{
//   List<DataImageActModel> result = List<DataImageActModel>.empty(growable: true);
//   try{
//     for(var item in src){
//       if((item.assetsImage != null && item.assetsImage!.isNotEmpty)){
//         var temp = await DataUtility.writeFile(item.assetsImage??"");
//         if(temp.isNotEmpty){
//           item.assetsImage = temp;
//           result.add(item);
//         }
//       }
//     }
//   }
//   catch(ex){
//     AppLogsUtils.instance.writeLogs(ex,func: "handleFileOffile app.Utility");
//   }
//   return result;
// }

// String handURLFilePrFileUpload(PrFileUpload? file) {
//   String result = "";
//   try {
//     if (file != null) {
//       if ((file.fileUrl??"").indexOf("http") >= 0) {
//         result = (file.fileUrl!) + "/" + file.fileName!;
//       } else {
//         var pathFolder = convertWindowPathToURL(file.fileUrl??"");
//         result = getServerName(false) + pathFolder + "/" + file.fileName!;
//       }
//     }
//   } catch (ex) {
//     AppLogsUtils.instance.writeLogs(ex,func: "handURLFilePrFileUpload app.Utility");
//   }
//   return result;
// }

// String handURLImageString(String? file) {
//   String result = "";
//   try {
//     if (file != null) {
//       if (file.indexOf("http") >= 0) {
//         result = file;
//         ;
//       } else {
//         result = getServerName(false) + file;
//       }
//     }
//   } catch (ex) {
//     AppLogsUtils.instance.writeLogs(ex,func: "handURLImageString app.Utility");
//   }
//   return result;
// }

//  // kiểm tra tần xuất làm công việc, nếu true thì 1 ngày nhiều lần
//   bool checkFrequencyOfWork(WorkingActModel working){
//     bool result = false;
//     try{
//       if(!PrCodeName.isEmpty(working.frequency) && working.frequency!.code == "02"){
//         result= true;
//       }
//     }
//     catch(ex){
//       AppLogsUtils.instance.writeLogs(ex,func: "checkFrequencyOfWork app.Utility");
//     }
//     return result;
//   }

// // kiểm tra loại hiển thị khi công việc thực hiện nhiều lần trong ngày
// bool checkDislayTypeFrequency(WorkingActModel working){
//   bool result = false;
//   if(checkFrequencyOfWork(working) && (!PrCodeName.isEmpty(working.displayType) && working.displayType!.code?.compareTo(AppDatas.listWorkDisplayType[0].code!)==0)){
//     result= true;
//   }
//   return result;
// }

// Future<String> getEncodeTraining(UserInfoModel userProfle) async {
//     DeviceDetailsModel device = await getDeviceDetailsModel();
//     Map<String, dynamic> map = {};
//     map['AccountId'] = 1000000;
//     map['CoachingID'] = '';
//     map['DeviceID'] = device.identifier != null && device.identifier!.isNotEmpty ? device.identifier : "1234567";
//     map['EmployeeId'] = userProfle.sysCode;
//     map['LoginID'] = 'id0256';
//     map['LoginIDForRP'] = '';
//     var jsonTemp = json.encode(map);
//   return base64Encode(utf8.encode(jsonTemp));
// }

// Future<File?> compressImage(File file,{int quality =40,int minWidth =1024,int minHeight = 640}) async {
//   final filePath = file.absolute.path;
//   // Create output file path
//   // eg:- "Volume/VM/abcd_out.jpeg"
//   final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
//   final splitted = filePath.substring(0, (lastIndex));
//   final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
//   var result = await FlutterImageCompress.compressAndGetFile(
//     file.absolute.path, outPath,
//     quality: quality,minWidth: minWidth,minHeight: minHeight, 
//   );
//   return result;
//  }

//  Future<void> openNavigationMap(double currentLatitude, double currentLongitude,double? latitude, double? longitude) async {
//     String googleUrl = "https://www.google.com/maps/dir/?api=1&origin=${currentLatitude},${currentLongitude}&destination=${latitude},${longitude}&travelmode=driving&dir_action=navigate";
//     if (await canLaunchUrl(Uri.parse(googleUrl))) {
//       await launchUrl(Uri.parse(googleUrl),mode: LaunchMode.externalApplication);
//     } else {
//       Alert.toastShow("Không thể mở ứng dụng bản đồ, vui lòng kiểm tra thiệt bị của bạn!", AppColor.brightRed);
//     }
//   }

//   Future<void> openNavigatePhone(String phoneNumber) async {
//     final Uri _phoneUri = Uri(
//         scheme: "tel",
//         path: phoneNumber
//     );
//     try {
//       if (await canLaunchUrlString(_phoneUri.toString()))
//         await launchUrlString(_phoneUri.toString());
//     } catch (error) {
//       throw("Không thể chuyển cuộc gọi, vui lòng kiểm tra thiệt bị của bạn!");
//     }
//   }

  addSharedPreferences(String key,dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(value.runtimeType == String){
      await prefs.setString(key, value);
    } else if (value.runtimeType == int){
      await prefs.setInt(key, value);
    } else if (value.runtimeType == bool){
      await prefs.setBool(key, value);
    } else if (value.runtimeType == double){
      await prefs.setDouble(key, value);
    } else if (value.runtimeType == List){
      await prefs.setStringList(key, value);
    } else {
      print("Not add SharedPreferences");
    }
  }

  Future getSharedPreferences(String key,String type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic result;
    if(type == "String"){
      result = prefs.getString(key);
    } else if (type == "int"){
      result = prefs.getInt(key);
    } else if (type == "bool"){
      result = prefs.getBool(key);
    } else if (type == "double"){
      result = prefs.getDouble(key);
    } else if (type == "List"){
      result = prefs.getStringList(key);
    } else {
      print("Not add SharedPreferences");
      return;
    }
    return result;
  }

  removeSharedPreferences(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  double getAvgEvaluate(List? list){
    int totalEvaluate = list?.length??1;
    double avg = 5;
    if(list != null && list.isNotEmpty){
      avg = (list.map((m) => int.parse(m.star??"0")).reduce((a, b) => a + b)) / totalEvaluate;
    }
    return avg;
  }