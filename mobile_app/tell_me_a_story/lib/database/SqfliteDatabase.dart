import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDB {
  SqfliteDB._();
  static final SqfliteDB instance = SqfliteDB._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  static const migrationScripts = [];

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Character ("
          "id INTEGER PRIMARY KEY,"
          "name UNIQUE TEXT,"
          "personalities TEXT,"
          ")");
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      for (var i = oldVersion - 1; i <= newVersion - 1; i++) {
        await db.execute(migrationScripts[i]);
      }
    });
  }
}
