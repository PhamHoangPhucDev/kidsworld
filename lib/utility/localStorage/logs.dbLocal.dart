

import 'package:sembast/sembast.dart';

import '../logs/appLogs.Utility.dart';
import 'dbConnect.Utility.dart';

class LogsDBLocal{
  static final LogsDBLocal _logsDBLocal = LogsDBLocal._();
  static LogsDBLocal get instance => _logsDBLocal;
  LogsDBLocal._();
  Future<Database> get _db async => await DBConnectUility.instance.databaseTemp;
  
  Future<String> insertLog(LogInfo data) async{
    String result ="";
    try{
      var store = stringMapStoreFactory.store('logs');
      result = await store.add(await _db,data.toJson());
    }
    catch(ex){
      AppLogsUtils.instance.writeLogs(ex,func: "insertLog logs.dbLocal");
    }
    return result;
  }
  
  Future<int> insertLogs(List<LogInfo> datas) async{
    int result =0;
    try{
      for(var item in datas){
          var insertResult = await insertLog(item);
          if(insertResult.isNotEmpty){
            result++;
          }
      }
    }
    catch(ex){
      AppLogsUtils.instance.writeLogs(ex,func: "insertLogs logs.dbLocal");
    }
    return result;
  }

  // tìm kiếm bản ghi theo ngày
  Future<List<LogInfo>> findLogsByDate(DateTime date, {DateTime? toDate}) async{
     List<LogInfo> result = List<LogInfo>.empty(growable: true);
    try{
      var store = stringMapStoreFactory.store('logs');
      var finder = Finder(
        sortOrders: [SortOrder("longTime")]
      );
      if(toDate != null){
        finder.filter = Filter.greaterThanOrEquals("longTime", date.millisecondsSinceEpoch) & Filter.lessThanOrEquals("longTime", toDate.millisecondsSinceEpoch);
      }
      else{
        finder.filter = Filter.equals("longTime", date.millisecondsSinceEpoch);
      }
      var _result = await store.find(await _db,finder: finder);
      if(_result.isNotEmpty){
        result = _result.map((e) => LogInfo.fromJson(e.value)).toList();
      }
    }
    catch(ex){
      AppLogsUtils.instance.writeLogs(ex,func: "findLogsByDate logs.dbLocal");
    }
    return result;
  }

  // lấy danh sách công việc theo mã working plan
  // Future<List<WorkingActModel>> findAllLogs(String sysCodeWP) async{
  //   List<WorkingActModel> result = List<WorkingActModel>.empty(growable: true);
  //   try{
  //     var store = stringMapStoreFactory.store('logs');
  //     var _result = await store.find(await _db,finder: Finder(sortOrders: [SortOrder("longTime")]));
  //     if(_result.isNotEmpty){
  //       result = _result.map((e) => WorkingActModel.fromJson(e.value)).toList();
  //     }
  //   }
  //   catch(ex){
  //     AppLogsUtils.instance.writeLogs(ex,func: "findAllLogs logs.dbLocal");
  //   }
  //   return result;
  // }
}