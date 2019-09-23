import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Database {
  static final Database _database = new Database._internal();
  Db _db;

  factory Database() {
    return _database;
  }

  Future<DbCollection> get database async {
    if (_database != null) return _db.collection("story");

    // if _database is null we instantiate it
    _db = await initDb();
    return _db.collection("story");
  }

  initDb() async {
    _db = new Db(
        "mongodb://acassar:${DotEnv().env['BDD_PASS']}@tell-me-a-story.onthewifi.com:27017/story");
    await _db.open();
  }

  Database._internal() {
    initDb();
  }
}
