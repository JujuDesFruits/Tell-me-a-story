import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';

class CustomRow extends StatelessWidget {
  final title;
  final content;
  final icon;
  final iconColor;

  CustomRow(this.title, this.content, {this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(color: CustomColors.paleYellow),
              ),
              Text(
                content,
                style: TextStyle(color: Colors.white),
              ),
              icon != null
                  ? Container(
                    margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        icon,
                        color: iconColor,
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
