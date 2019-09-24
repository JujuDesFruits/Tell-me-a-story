import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tell_me_a_story/CustomWidget/Background.dart';
import 'package:tell_me_a_story/CustomWidget/StoryCard.dart';
import 'package:tell_me_a_story/Story/StoryInfo.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';
import 'package:tell_me_a_story/database/helpers/StoryHelper.dart';
import 'package:tell_me_a_story/database/models/Story.dart';

class StoryChoice extends StatefulWidget {
  @override
  _StoryChoice createState() => _StoryChoice();
}

class _StoryChoice extends State<StoryChoice> {
  List<Story> stories;

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    stories = Story.listToStories(await StoryHelper.getStories());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> storiesWidgets = new List();

    if (stories != null) {
      for (Story story in stories) {
        storiesWidgets.add(
          StoryCard(
            title: "Le commencement",
            color: CustomColors.lightBlue,
            resume: story.resume,
            date: story.date,
            author: story.author,
            players: story.players.toString().replaceFirst(".", " à "),
            action: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return StoryInfo(
                  story: story,
                );
              }));
            },
          ),
        );
      }
    }

    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: storiesWidgets),
        ),
      ],
    ));
  }
}
