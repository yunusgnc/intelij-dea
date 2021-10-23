import 'dart:async';

import 'package:flutterwhatsapp/pages/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "settings.db");
    var eTrade = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return eTrade;
  }

  void createDb(Database db, int version) async {
    await db.execute("Create table settings(setting text, preference text)");
  }

  Future<List<Settings>> getDatabase() async {
    Database db = await this._db;
    var result = await db.query("settings");
    return List.generate(result.length, (i) {
      return Settings.fromObject(result[i]);
    });
  }

  Future<int> insert(Settings setting) async {
    Database db = await this._db;
    var result = db.insert("settings", setting.toMap());
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this._db;
    var result = db.rawDelete("delete from settings where id=$id");
    return result;
  }

  Future<int> update(Settings setting) async {
    Database db = await this._db;
    var result = db.update("settings", setting.toMap(),
        where: "setting=?", whereArgs: [setting.setting]);
    return result;
  }
}
