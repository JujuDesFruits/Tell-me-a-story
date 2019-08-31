import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatefulWidget {
  double width;
  Widget content;
  Icon icon;
  Color color;
  dynamic callBack;

  CustomButton(
      {this.width, this.color, this.content, this.icon, this.callBack});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    List<Widget> content = new List();
    if (widget.icon != null)
      content.add(
          Container(margin: EdgeInsets.only(right: 5), child: widget.icon));
    if (widget.content != null) content.add(widget.content);

    return Container(
      margin: EdgeInsets.all(10),
      width: widget.width,
      child: CupertinoButton(
        padding: EdgeInsets.all(5),
        onPressed: widget.callBack == null ? () {} : widget.callBack,
        color: widget.color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: content,
        ),
      ),
    );
  }
}
