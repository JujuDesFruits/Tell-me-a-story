import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tell_me_a_story/CustomWidget/CustomButton.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';
import 'package:package_info/package_info.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      // backgroundColor: CustomColors.background,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [CustomColors.background, CustomColors.background2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, left: 5, right: 5, bottom: 20),
              child: Center(
                child: Text(
                  "Tell me a story",
                  style: TextStyle(
                      color: CustomColors.primary,
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Timoteo"),
                ),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    width: buttonWidth,
                    color: CustomColors.secondary,
                    content: Text("Entrer dans l'histoire"),
                    icon: Icon(Icons.flight_takeoff),
                  ),
                  CustomButton(
                    width: buttonWidth,
                    color: CustomColors.lightBlue,
                    content: Text("Paramètres"),
                    icon: Icon(Icons.settings),
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
      ),
    );
  }
}
