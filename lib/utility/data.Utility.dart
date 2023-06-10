import 'dart:io';
// import 'package:dio/dio.dart';
import 'package:kidsworld/utility/app.Utility.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'logs/appLogs.Utility.dart';
class DataUtility{
  static final String dataFile ="files";
  static final String dataDB ="db";
  static final String dataConfig ="configs";
  static Future<void> initialization() async{
    await initializationFolder(dataFile);
    await initializationFolder(dataDB);
    await initializationFolder(dataConfig);
  }
  // static ConfigDBLocal configDBLocal = new ConfigDBLocal();

  // static Future<String> writeTXTFile(String fileName,String src) async {
  //   String path = "";
  //   try{
  //     var rootPath = await initializationFolder(dataFile);
  //     var folderByDate = await createFolder(rootPath, convertDateToInt(date: DateTime.now()).toString());
  //     final File file = File('${folderByDate}/${fileName}.txt');
  //     await file.writeAsString(src);
  //     path = file.path;
  //   }
  //   catch(ex){
  //     AppLogsUtils.instance.writeLogs(ex,func: "writeTXTFile data.Utility");
  //   }
  //   return path;
  // }

  // static Future<String> readTXTFile(String path) async {
  //   String values = "";
  //   try{
  //     if(await File(path).exists()){
  //       final File file = File(Uri.parse(path).path);
  //       values = await file.readAsString();
  //     }
  //     else{
  //       AppLogsUtils.instance.writeLogs("File not exists , path : ${path}",func: "writeTXTFile data.Utility");
  //     }
  //   }
  //   catch(ex){
  //     AppLogsUtils.instance.writeLogs(ex,func: "writeTXTFile data.Utility");
  //   }
  //   return values;
  // }
  static Future<String> writeTXTTempFile(String fileName,String src) async {
    String path = "";
    try{
      var rootPath = await getTemporaryDirectory();
      var folderByDate = await createFolder(rootPath.path, convertDateToInt(date: DateTime.now()).toString());
      final File file = File('${folderByDate}/${fileName}.txt');
      await file.writeAsString(src);
      path = file.path;
    }
    catch(ex){
      AppLogsUtils.instance.writeLogs(ex,func: "writeTXTTempFile data.Utility");
    }
    return path;
  }

  // static Future<String> writeFile(String srcpath,{String fileNameIN="",String? nameFolder,String? nameSubFolder}) async{
  //   String path = "";
  //   try{
  //     String rootPath = await initializationFolder(nameFolder??dataFile);
  //     var folderByDate = await createFolder(rootPath, nameSubFolder ??convertDateToInt(date: DateTime.now()).toString());
  //     final File file = File(srcpath);
  //     String fileName =p.basename(srcpath);
  //     if(fileNameIN.isNotEmpty){
  //       var _fileExtension = p.extension(srcpath);
  //       fileName = fileNameIN+_fileExtension;
  //     }
  //     String newPath = folderByDate+"/"+fileName;
  //     var newFile = await moveFile(file, newPath);
  //     path = newFile.path;
  //   }
  //   catch(ex){
  //     AppLogsUtils.instance.writeLogs(ex,func: "writeFile data.Utility");
  //   }
  //   return path;
  // }

  
  // static Future saveFileNotExist({required PrCodeName item})async{
  //   try {
  //     if(!PrCodeName.isEmpty(item) && item.codeDisplay=="file" &&!File(item.value!).existsSync()){
  //       var result = await downloadFileConfig(item);
  //       await ConfigDBLocal().insertOneConfig(result);
  //     }
  //   } catch (ex) {
  //     AppLogsUtils.instance.writeLogs(ex,func: "saveFileNotExist data.Utility");
  //   }
  // }

  // static Future<String> saveFileNetwork({required PrCodeName item,String? fileName})async{
  //   String filePathAndName ="";
  //   try {
  //     ConfigDBLocal configDBLocal = ConfigDBLocal();
  //     var fileInfo = await configDBLocal.findOneLocalFile(item.code??"");
  //     // tồn tại thông tin file + file có thực trên máy
  //     if(!PrCodeName.isEmpty(fileInfo) && File(fileInfo.name??"").existsSync()){
  //       filePathAndName = fileInfo.name??"";
  //     }
  //     else{
        
  //       var documentDirectory = await initializationFolder(dataFile);
  //       var folderByDate = await createFolder(documentDirectory, convertDateToInt(date: DateTime.now()).toString());
  //       String _fileName = generateKeyCode();
  //       filePathAndName = '${folderByDate}/file_'+_fileName+p.extension(item.name??"");
  //       //File file = await File(filePathAndName).create(recursive: true); // <-- 1
  //       await Dio().downloadUri(Uri.parse(item.name??""),filePathAndName);
  //     }
      
  //   } catch (ex) {
  //     AppLogsUtils.instance.writeLogs(ex,func: "saveFileToFolder data.Utility");
  //   }
  //   return filePathAndName;
  // }

  // static Future removeOldConfig(String oldSysKey) async{
  //   try {
  //     List<PrCodeName> tempOldConfig = await configDBLocal.findAllConfig("codeDisplay",oldSysKey);
  //     for(var i in tempOldConfig){
  //       if((i.name!=null&&i.name!.isNotEmpty) && File(i.name!).existsSync()){
  //         File(i.name!).deleteSync();
  //       }
  //     }
  //     await configDBLocal.removeOneConfig("codeDisplay",oldSysKey);
  //   } catch (ex) {
  //     AppLogsUtils.instance.writeLogs(ex,func: "removeOldConfigFileAndDBLocal data.Utility");
  //   }
  // }

  // static Future<String> getConfigByKey(String key) async{
  //   String result = "";
  //   PrCodeName tempConfig = await configDBLocal.findOneConfig("code", key);
  //   await saveFileNotExist(item: tempConfig);
  //   try {
  //     if(!PrCodeName.isEmpty(tempConfig) && tempConfig.value == "file" && !File(tempConfig.name!).existsSync()){
  //       AppLogsUtils.instance.writeLogs("File is not exists , path : ${tempConfig.name} ",func: "getConfigDBLocal data.Utility");
  //     }
  //   } catch (ex) {
  //     AppLogsUtils.instance.writeLogs(ex,func: "getConfigDBLocal data.Utility");
  //   }

  //   if(!PrCodeName.isEmpty(tempConfig)){
  //     if(tempConfig.codeDisplay =="file"){
  //       result =tempConfig.value;
  //     }
  //     else{
  //       result = tempConfig.name??"";
  //     }
  //   }
  //   return result;
  // }

  // static Future<PrCodeName> downloadFileConfig(PrCodeName data) async{
  //   PrCodeName result = data;
  //   try{
  //     if(!PrCodeName.isEmpty(data)){
  //       String filePathAndName="";
  //       String rootPath = await initializationFolder(dataFile);
  //       String folderByDate = await createFolder(rootPath,"configfiles");
  //       String _fileName = generateKeyCode();
  //       filePathAndName = '${folderByDate}/file_'+_fileName+p.extension(data.name??"");
  //       await Dio().downloadUri(Uri.parse(data.name??""), filePathAndName);
  //       result.value =filePathAndName;
  //     }
  //   }
  //   catch(ex){
  //     AppLogsUtils.instance.writeLogs("${ex} | ${data.toJson()}",func: "downloadFileConfig");
  //   }
  //   return result;
  // }

  // // Function xử lý download --> Download file, map local file vs key tương ứng ở db
  // static Future<void> handleDownloadConfigFile(List<PrCodeName> datas,{String? syskey})async{
  //   try{
  //     // xử lý dữ liệu (download file + ghi localdb)
  //     //ConfigDBLocal().insertOneConfig(null,);
  //     for(var item in datas){
  //       item.value2 = syskey;
  //       //kiểm tra loại config có phải là file ko?
  //       if(item.codeDisplay == "file"){
  //         item = await downloadFileConfig(item);
  //       }
  //       // lưu xuống db
  //       await ConfigDBLocal().insertOneConfig(item);
  //     }
  //   }
  //   catch(ex){
  //     AppLogsUtils.instance.writeLogs(ex,func: "handleDownloadConfigFile");
  //   }
  // } 
  // // Function check key , kiểm tra mới cũ , 

  // static Future<void> handleExistConfigChecking(String configKey) async{
  //   ResponsesModel response = ResponsesModel.create();
  //   if(configKey==AppDatas.sysKeyActConfig){
  //     String currentSysKey = await DataUtility.getConfigByKey(configKey);
  //     response = await AppProvider().getProgramConfig(sysKey: currentSysKey);
  //   }
  //   else{
  //     String currentSysKey = await DataUtility.getConfigByKey(configKey);
  //     response = await AppProvider().getAppConfig(sysKey: currentSysKey);
  //   }
  //   // truyờng hợp download mới data
  //   if(response.statusCode ==0){
  //     await handleDownloadConfigFile(response.data,syskey: configKey);
  //   }
  //   // không có data mới cần download
  //   else{
  //     await localFileFullyChecking(configKey);
  //   }

  // } 
  // // gọi api lấy config activation --> list<PrcodeName> or rỗng
  // // list<PrcodeName> --> có syskey (là để kiểm tra xem thử dữ liệu điện thoại vs server có khớp nhau hay ko)


  // // Function kiểm tra toàn vẹn dữ liệu --> check list key-value ở local có file nào hỏng --> downlaod lại
  // static Future<void> localFileFullyChecking(String sysKey) async{
  //   try{
  //     // lấy danh sách config theo syskey
  //     List<PrCodeName> configBySyskey = await ConfigDBLocal().findConfigBySysKey(sysKey);
  //     for(var config in configBySyskey){
  //       if(PrCodeName.isEmpty(config) || (!PrCodeName.isEmpty(config) && !File(config.value??"").existsSync())){
  //         var temp = await downloadFileConfig(config);
  //         await ConfigDBLocal().insertOneConfig(temp);
  //       }
  //     }
  //   }
  //   catch(ex){
  //     AppLogsUtils.instance.writeLogs(ex,func: "localFileFullyChecking");
  //   }
  // }
}

enum TypeFolder{
  DATAFILE,
  DATADB,
  DATACONFIG
}