import 'package:flutter/cupertino.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
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
                                icon: Icons.supervised_user_circle,
                                iconColor: Colors.lightBlue,
                          ),
                          CustomRow(
                            "Pages: ",
                            widget.story.pages.toString(),
                            icon: CupertinoIcons.book_solid,
                            iconColor: Colors.white,
                          ),
                          CustomRow(
                            "Nombre de vies: ",
                            widget.story.life.toString(),
                            icon: CupertinoIcons.heart_solid,
                            iconColor: Colors.red,
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
                          icon: Icons.star,
                          iconColor: Colors.yellow,
                        ),
                        CustomRow(
                          "Votes: ",
                          widget.story.vote.toString(),
                          icon: Icons.person_pin,
                          iconColor: Colors.cyan,
                        ),
                        CustomRow(
                          "Créé le: ",
                          widget.story.date.toString(),
                          icon: Icons.date_range,
                          iconColor: Colors.white,
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
            ],
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: MaterialButton(
                      onPressed: () {},
                      color: CustomColors.green,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Commencer",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
