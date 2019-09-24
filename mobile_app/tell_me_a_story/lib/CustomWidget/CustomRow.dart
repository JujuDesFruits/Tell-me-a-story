import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';

class CustomRow extends StatelessWidget {
  final title;
  final content;

  CustomRow(this.title, this.content);

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
            ],
          ),
        ],
      ),
    );
  }
}
