class Scene {
  final dynamic id;
  final dynamic scene;
  final dynamic action;
  final dynamic child;

  Scene({this.id, this.scene, this.action, this.child});

  static listToScenes(List<Map<String, dynamic>> list) {
    List<Scene> scenes = new List();
    for (Map<String, dynamic> item in list) {
      Scene scene = new Scene(
        id: item["_id"],
        scene: item["scene"],
        action: item["action"],
        child: item["child"],
      );
      scenes.add(scene);
    }
    return scenes;
  }
}
