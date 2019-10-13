import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tell_me_a_story/Characters/CharacterForm.dart';
import 'package:tell_me_a_story/CustomWidget/Background.dart';
import 'package:tell_me_a_story/CustomWidget/BigButton.dart';
import 'package:tell_me_a_story/CustomWidget/BottomButton.dart';
import 'package:tell_me_a_story/CustomWidget/CustomButton.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';
import 'package:tell_me_a_story/database/models/Character.dart';
import 'package:tell_me_a_story/database/models/Story.dart';

class CharacterCreation extends StatefulWidget {
  final Story story;

  CharacterCreation({this.story});

  @override
  _CharacterCreationState createState() => _CharacterCreationState();
}

class _CharacterCreationState extends State<CharacterCreation> {
  List<Character> characters = new List();
  bool isCreating = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetContent;
    if (isCreating) {
      widgetContent = CharacterForm();
    } else {
      widgetContent = Container();
    }

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 5, right: 5, top: 30, bottom: 20),
                child: Center(
                    child: Text(
                  "Création des personnages",
                  style:
                      TextStyle(color: CustomColors.paleYellow, fontSize: 20),
                )),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomButton(
                    callBack: () {
                      setState(() {
                        isCreating = !isCreating;
                      });
                    },
                    color: CustomColors.lightBlue,
                    content: Text(isCreating ? "OK" : "Ajouter"),
                  ),
                  Flexible(child: widgetContent, fit: FlexFit.loose,)
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    "${characters.length}/${widget.story.players.toString().split('.')[1]}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              BottomButton(
                action: () {},
                color: CustomColors.green,
                content: Text(
                  "Valider",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
