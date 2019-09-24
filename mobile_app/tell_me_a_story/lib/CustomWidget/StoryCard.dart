import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tell_me_a_story/CustomWidget/CustomRow.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';

class StoryCard extends StatelessWidget {
  final textColor = Colors.white;
  final double textSize = 20;
  final String title;
  final String resume;
  final dynamic action;
  final String author;
  final Color color;
  final String date;
  final String players;
  final String pages;
  final String vote;
  final String popularity;

  StoryCard({
    this.title,
    this.resume,
    this.action,
    this.author,
    this.color,
    this.date,
    this.players,
    this.pages,
    this.popularity,
    this.vote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        CustomColors.lightBlue,
        CustomColors.blue.withAlpha(030)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: FlatButton(
        disabledColor: color.withOpacity(0.2),
        onPressed: action,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 15, left: 5, right: 5),
                child: Text(
                  title,
                  style: TextStyle(color: textColor, fontSize: textSize),
                ),
              ),
              Flexible(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 30),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: CustomColors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30))),
                      child: Text(
                        resume,
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Row(
                        children: [
                          Text(
                            "créé par ",
                            style: TextStyle(color: textColor),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                                color: CustomColors.purple,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              author,
                              style: TextStyle(color: textColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Center(
              //   child: Container(
              //     padding:
              //         EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              //     decoration: BoxDecoration(
              //         color: CustomColors.purple,
              //         borderRadius: BorderRadius.only(
              //             bottomLeft: Radius.elliptical(40, 50),
              //             bottomRight: Radius.elliptical(40, 50))),
              //     child: Text(
              //       "Infos",
              //       style: TextStyle(color: Colors.white, fontSize: 20),
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Joueurs: ",
                            style: TextStyle(color: CustomColors.orange),
                          ),
                        ),
                        Container(
                          child: Text(
                            players,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Créé le: ",
                            style: TextStyle(color: CustomColors.orange),
                          ),
                        ),
                        Container(
                          child: Text(
                            date,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
