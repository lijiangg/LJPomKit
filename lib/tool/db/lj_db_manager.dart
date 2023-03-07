import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:lj_pom_kit/util/lj_device_util.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sqflite/sqflite.dart';

class LJDBManager {
  factory LJDBManager() => LJDBManager._instance;
  static final LJDBManager _instance = LJDBManager._private();

  LJDBManager._private();

  String? _secureKey;

  /*
  * return db create path
  * CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)
  * */
  Future<String> createDB(String tableName, String sql) async {
    var databasesPath = await getDatabasesPath();
    String path =  "$databasesPath/$tableName.db";
    Completer<String> completer = Completer();
    print("path: $path");
    openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(sql);
      //关闭数据库
      await db.close();
      completer.complete(path);
    });
    return completer.future;
  }

  Future<Database> _openDB(String tableName) async {
    var databasesPath = await getDatabasesPath();
    String path =  "$databasesPath/$tableName.db";
    return openReadOnlyDatabase(path);
  }

  Future _closeDB(Database database) async {
    // Close the database
    await database.close();
  }

  //增 INSERT INTO Test(name, value, num) VALUES(?, ?, ?)
  Future<bool> insert(String tableName, String sql, List<Object?>? valueList) async {
    Database database = await _openDB(tableName);
    Completer<bool> completer = Completer();
    database.transaction((txn) async {
      int id = await txn.rawInsert(sql, valueList);
      //关闭数据库
      _closeDB(database);
      completer.complete(id != 0);
    });
    return completer.future;
  }

  //查 SELECT * FROM Test
  Future<List<Map<String, Object?>>> query(String tableName, String sql) async {
    Database database = await _openDB(tableName);
    List<Map<String, Object?>> dataList = await database.rawQuery(sql);
    //关闭数据库
    _closeDB(database);
    return dataList;
  }

  //改 UPDATE Test SET name = ?, value = ? WHERE name = ?
  Future<int> update(String tableName, String sql, List<Object?>? valueList) async {
    Database database = await _openDB(tableName);
    int count = await database.rawUpdate(sql, valueList);
    //关闭数据库
    _closeDB(database);
    return count;
  }

  //删 database.rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
  Future<int> delete(String tableName, String sql, List<Object?>? valueList) async {
    Database database = await _openDB(tableName);
    int count = await database.rawDelete(sql, valueList);
    //关闭数据库
    _closeDB(database);
    return count;
  }

  Future deleteDB(String tableName) async {
    // Delete the database
    var databasesPath = await getDatabasesPath();
    String path =  "$databasesPath/$tableName.db";
    return deleteDatabase(path);
  }
}