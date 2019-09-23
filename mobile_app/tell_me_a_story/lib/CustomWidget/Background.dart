import 'package:flutter/material.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';

class Background extends StatelessWidget {
  final child;

  Background({this.child});

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
        child: child,
      ),
    );
  }
}
