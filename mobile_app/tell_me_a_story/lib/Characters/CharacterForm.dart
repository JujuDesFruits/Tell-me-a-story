import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tell_me_a_story/Utils/Colors.dart';

class CharacterForm extends StatefulWidget {
  @override
  _CharacterFormState createState() => _CharacterFormState();
}

class _CharacterFormState extends State<CharacterForm> {
  final _formKey = GlobalKey<FormState>();

  String validator(String value) {
    if (value.isEmpty) {
      return 'Champs obligatoire';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      child: Center(
                    child: Text(
                      "Nom",
                      style: TextStyle(color: CustomColors.pink, fontSize: 16),
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: TextFormField(
                      validator: validator,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          filled: true),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Center(
                        child: Text(
                          "Personalités",
                          style:
                              TextStyle(color: CustomColors.pink, fontSize: 16),
                        ),
                      )),
                  // Flexible(
                  // fit: FlexFit.loose,
                  // child:
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(5),
                    child: ListView(
                      children: <Widget>[],
                    ),
                  ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
