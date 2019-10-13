import 'package:mongo_dart/mongo_dart.dart';
import 'package:tell_me_a_story/database/Database.dart';
import 'package:tell_me_a_story/database/SqfliteDatabase.dart';
import 'package:tell_me_a_story/database/models/Character.dart';

class CharacterHelper {
  getAll() async {
    final db = await SqfliteDB.instance.database;
    List<dynamic> res = await db.query("Characters");
    if (res != null && res.length > 0)
      return await Character.listToCharacters(res);
    else
      return null;
  }

  create(Character character) async {
    final db = await SqfliteDB.instance.database;
    await db.insert("Characters", character.toMap());
  }
}
