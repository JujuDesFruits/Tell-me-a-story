import 'package:flutter/material.dart';
import 'package:tell_me_a_story/CustomWidget/Background.dart';
import 'package:tell_me_a_story/CustomWidget/BigButton.dart';
import 'package:tell_me_a_story/CustomWidget/CustomButton.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';
import 'package:tell_me_a_story/database/helpers/SceneHelper.dart';
import 'package:tell_me_a_story/database/models/Scene.dart';
import 'package:tell_me_a_story/database/models/Story.dart';

class StoryPlayer extends StatefulWidget {
  final Story story;

  StoryPlayer({this.story});

  @override
  _StoryPlayerState createState() => _StoryPlayerState();
}

class _StoryPlayerState extends State<StoryPlayer> {
  Scene currentScene;
  String sceneText = "";
  List<String> sentences = new List();
  List<Widget> actions = new List();
  List<Scene> childs = new List();

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    await getFirstChilds();
    // sentences.addAll(currentScene.scene.toString().split("."));
    sceneText = widget.story.scene;
  }

  getNextChild(String action) async {
    currentScene = await Scene.listToScenes(
        await SceneHelper.getByAction(action: action))[0];

    buildText();

    actions = new List();
    childs = await Scene.listToScenes(
        await SceneHelper.get(parentId: currentScene.id));

    buildActions();

    setState(() {});
  }

  buildText() {
    List<String> badCars = currentScene.scene.toString().split("<bad>");
    List<String> goodCars = currentScene.scene.toString().split("<good>");

    sceneText = currentScene.scene.toString();
    if (badCars.length > 1) {
      String pattern = badCars[1];
      badCars[1] = badCars[1].replaceAll("<psd>", "TEST");
      sceneText = sceneText.replaceAll(pattern, badCars[1]);
    }

    if (goodCars.length > 1) {
      String pattern = goodCars[1];
      goodCars[1] = goodCars[1].replaceAll("<psd>", "TEST");
      sceneText = sceneText.replaceAll(pattern, goodCars[1]);
    }

    sceneText = sceneText
        .replaceAll("<good>", "")
        .replaceAll("<bad>", "")
        .replaceAll("<event>", "");
  }

  buildActions() {
    for (var child in childs) {
      actions.add(BigButton(
        callBackParam: child.action,
        callBack: getNextChild,
        content: child.action,
        color: CustomColors.lightBlue,
      ));
    }
  }

  getFirstChilds() async {
    childs = await Scene.listToScenes(
        await SceneHelper.get(parentId: widget.story.id));

    buildActions();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                // color: Colors.black,
                child: Text(
                  sceneText,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "DS",
                    fontSize: 20,
                    letterSpacing: 2,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Container(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: actions,
              ),
            )
          ],
        ),
      ),
    );
  }
}
