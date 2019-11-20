import 'package:flutter/material.dart';
import 'package:flutterprojects/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
