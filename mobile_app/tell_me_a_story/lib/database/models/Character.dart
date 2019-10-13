class Character {
  final int id;
  final String name;
  final String personalities;

  Character({this.id, this.name, this.personalities});

  static listToCharacters(List<Map<String, dynamic>> list) {
    List<Character> scenes = new List();
    for (Map<String, dynamic> item in list) {
      Character character = new Character(
        id: item["id"],
        name: item["name"],
        personalities: item["personalities"],
      );
      scenes.add(character);
    }
    return scenes;
  }

  toMap() {
    return {
      "id": this.id,
      "name": this.name,
      "personalities": this.personalities,
    };
  }
}
