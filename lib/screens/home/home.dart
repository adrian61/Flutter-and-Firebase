
import 'package:flutter/material.dart';
import 'package:flutterprojects/models/translation.dart';
import 'package:flutterprojects/screens/home/translation_list.dart';
import 'package:flutterprojects/services/auth.dart';
import 'package:flutterprojects/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Translation>>.value(
      value: DatabaseService().translationSnapshot,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('Fiszki'),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _authService.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('logout'))
          ],
        ),
        body: TranslationList(),
      ),
    );
  }
}
