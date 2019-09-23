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
      margin: EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                content,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Container(
            height: 2,
            color: CustomColors.paleYellow,
          )
        ],
      ),
    );
  }
}
