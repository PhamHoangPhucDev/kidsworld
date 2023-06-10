import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../app.Utility.dart';
import '../data.Utility.dart';

class DBConnectUility {
  String dataDB = "erpLocal.db";
  String tempDB = "erpTempLocal.db";
  static final DBConnectUility _singleton = DBConnectUility._();
  static DBConnectUility get instance => _singleton;
  Completer<Database>? _dbOpenCompleter;
  DBConnectUility._();

  // flag --> loại db , 1 = dataDB, 0= tempDB
  // Database object accessor
  Future<Database> get database async {
    // If completer is null, AppDatabaseClass is newly instantiated, so database is not yet opened
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      // Calling _openDatabase will also complete the completer with database instance
      _openDatabase(flag: 1);
    }
    // If the database is already opened, awaiting the future will happen instantly.
    // Otherwise, awaiting the returned future will take some time - until complete() is called
    // on the Completer in _openDatabase() below.
    return _dbOpenCompleter!.future;
  }
  Future<Database> get databaseTemp async {
    // If completer is null, AppDatabaseClass is newly instantiated, so database is not yet opened
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      // Calling _openDatabase will also complete the completer with database instance
      _openDatabase(flag: 0);
    }
    // If the database is already opened, awaiting the future will happen instantly.
    // Otherwise, awaiting the returned future will take some time - until complete() is called
    // on the Completer in _openDatabase() below.
    return _dbOpenCompleter!.future;
  }
  

  Future _openDatabase({int flag =1}) async {
    // Get a platform-specific directory where persistent app data can be stored
    String localPath = await initializationFolder(DataUtility.dataDB);
    // Path with the form: /platform-specific-directory/demo.db
    String dbName =dataDB;
    if(flag ==0){
      dbName = tempDB;
    }
    var dbPath = join(localPath,dbName);
    // open db
    printInfo(info: "${dbName} initializeDB");
    final database = await databaseFactoryIo.openDatabase(dbPath);

    // Any code awaiting the Completer's future will now start executing
    _dbOpenCompleter!.complete(database);
  }
}