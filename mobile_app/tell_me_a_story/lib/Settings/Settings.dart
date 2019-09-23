import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  widgetRow(title) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Switch(
              activeColor: CustomColors.green,
              inactiveThumbColor: CustomColors.grenateRed,
              value: false,
              onChanged: (newValue) {
                //todo
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [CustomColors.background, CustomColors.background2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 40, left: 5, right: 5, bottom: 20),
                child: Text(
                  "Settings",
                  style: TextStyle(fontSize: 30, color: CustomColors.orange),
                ),
              ),
            ),
            Container(
              width: 300,
              height: 3,
              color: CustomColors.lightBlue,
            ),
            widgetRow("Animations :"),
            widgetRow("Son :"),
          ],
        ),
      ),
    );
  }
}
