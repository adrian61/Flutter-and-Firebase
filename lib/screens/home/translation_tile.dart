import 'package:flutter/material.dart';
import 'package:flutterprojects/models/translation.dart';

class TranslationTile extends StatelessWidget {
  final Translation translation;

  TranslationTile({this.translation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue[100],
          ),
          title: Text(translation.name),
          subtitle: Text(translation.translationMap.toString()),
        ),
      ),
    );
  }
}
