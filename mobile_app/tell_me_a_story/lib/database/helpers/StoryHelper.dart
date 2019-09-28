import 'package:mongo_dart/mongo_dart.dart';
import 'package:tell_me_a_story/database/Database.dart';

class StoryHelper {
  static dynamic get() async {
    DbCollection db = await Database().database;
    return await db.find({"child": null}).toList();
  }
}
