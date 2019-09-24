import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tell_me_a_story/CustomWidget/Background.dart';
import 'package:tell_me_a_story/CustomWidget/CustomButton.dart';
import 'package:tell_me_a_story/CustomWidget/CustomRow.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';
import 'package:tell_me_a_story/database/models/Story.dart';

class StoryInfo extends StatefulWidget {
  final Story story;

  StoryInfo({this.story});

  @override
  _StoryInfoState createState() => _StoryInfoState();
}

class _StoryInfoState extends State<StoryInfo> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //todo: remplacer par story.title quand ce sera dispo
              Container(
                margin: EdgeInsets.only(top: 50, left: 5, right: 5),
                child: Text(
                  "Le commencement",
                  style: TextStyle(
                      color: CustomColors.purple,
                      fontSize: 25,
                      fontFamily: "Timoteo"),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  widget.story.resume,
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 30,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: CustomColors.lightBlue.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomRow(
                        "Joueurs: ",
                        widget.story.players
                            .toString()
                            .replaceFirst(".", " à "),
                      ),
                      CustomRow(
                        "Pages: ",
                        widget.story.pages.toString(),
                      ),
                      CustomRow(
                        "Nombre de vies: ",
                        widget.story.life.toString(),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 2,
                    color: CustomColors.orange,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomRow(
                      "Popularité: ",
                      widget.story.popularity.toString(),
                    ),
                    CustomRow(
                      "Votes: ",
                      widget.story.vote.toString(),
                    ),
                    CustomRow(
                      "Créé le: ",
                      widget.story.date.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomButton(
            color: CustomColors.orange,
            content: Text("Voir les personnalités disponibles"),
          ),
          CustomButton(
            color: CustomColors.green,
            content: Text("Commencer"),
          )
        ],
      ),
    );
  }
}
