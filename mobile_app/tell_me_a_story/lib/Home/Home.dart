import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tell_me_a_story/CustomWidget/Background.dart';
import 'package:tell_me_a_story/CustomWidget/CustomButton.dart';
import 'package:tell_me_a_story/Home/StoryChoice.dart';
import 'package:tell_me_a_story/Settings/Settings.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';
import 'package:package_info/package_info.dart';
import 'package:tell_me_a_story/database/Database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _version = "";
  static double buttonWidth = 250;

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _version = packageInfo.version;
    //init database
    Database();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 5, right: 5, bottom: 20),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "Tell me a story",
                    style: TextStyle(
                        color: CustomColors.paleYellow,
                        fontSize: 38,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Timoteo"),
                  ),
                  Container(
                    width: 300,
                    height: 3,
                    color: CustomColors.lightBlue,
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  width: buttonWidth,
                  color: CustomColors.orange,
                  content: Text("Voir les histoires"),
                  icon: Icon(Icons.import_contacts),
                  callBack: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return StoryChoice();
                    }));
                  },
                ),
                CustomButton(
                  width: buttonWidth,
                  color: CustomColors.lightBlue,
                  content: Text("Paramètres"),
                  icon: Icon(Icons.settings),
                  callBack: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Settings();
                    }));
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  "Version : " + _version,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
