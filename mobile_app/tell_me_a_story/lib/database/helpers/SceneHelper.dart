import 'package:mongo_dart/mongo_dart.dart';
import 'package:tell_me_a_story/database/Database.dart';

class SceneHelper {
  static dynamic get({dynamic parentId}) async {
    DbCollection db = await Database().database;
    return await db.find({"child": parentId}).toList();
  }

  static dynamic getAll({dynamic parentId}) async {
    DbCollection db = await Database().database;
    return await db.find().toList();
  }
}
