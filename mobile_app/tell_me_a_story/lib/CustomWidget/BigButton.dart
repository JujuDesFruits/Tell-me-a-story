import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BigButton extends StatefulWidget {
  final double width;
  final String content;
  final Color color;
  final dynamic callBack;

  BigButton({this.width, this.color, this.content, this.callBack});

  @override
  _BigButtonState createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  @override
  Widget build(BuildContext context) {
    List<Widget> content = new List();

    if (widget.content != null)
      content.add(
        Expanded(
            child: Center(
          child: Container(
            child: Text(
              widget.content,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )),
      );

    return Container(
      margin: EdgeInsets.all(10),
      width: 150,
      height: 100,
      child: CupertinoButton(
        padding: EdgeInsets.all(5),
        onPressed: widget.callBack == null ? () {} : widget.callBack,
        color: widget.color,
        child: Row(
          children: content,
        ),
      ),
    );
  }
}
