import 'package:flutter/material.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';


/// Has to be placed at the end of the screen in the parent
class BottomButton extends StatelessWidget {
  final action;
  final Widget content;
  final Color color;

  BottomButton({this.action, this.content, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
                child: MaterialButton(
              onPressed: action,
              color: color,
              child: Container(
                padding: EdgeInsets.all(20),
                child: content,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
