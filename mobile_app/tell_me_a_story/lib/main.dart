import 'package:flutter/material.dart';
import 'package:tell_me_a_story/Home/Home.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
