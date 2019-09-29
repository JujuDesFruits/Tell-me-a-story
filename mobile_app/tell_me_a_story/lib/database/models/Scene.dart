class Scene {
  final dynamic id;
  final dynamic scene;
  final dynamic action;
  final dynamic child;
  final dynamic goodCar;
  final dynamic badCar;
  final dynamic gameOver;

  Scene({this.id, this.scene, this.action, this.child, this.badCar, this.goodCar, this.gameOver});

  static listToScenes(List<Map<String, dynamic>> list) {
    List<Scene> scenes = new List();
    for (Map<String, dynamic> item in list) {
      Scene scene = new Scene(
        id: item["_id"],
        scene: item["scene"],
        action: item["action"],
        child: item["child"],
        goodCar: item["goodCar"],
        badCar: item["badCar"],
        gameOver: item["gameover"],
      );
      scenes.add(scene);
    }
    return scenes;
  }
}
