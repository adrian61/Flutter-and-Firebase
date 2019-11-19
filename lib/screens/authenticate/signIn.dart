import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterprojects/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Sign in'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text('Sign in anonymously'),
          onPressed: () async {
            dynamic result = await _authService.signInAnonymously();
            if(result == null){
              print('error sign in');
            }
            else {
              print('signed in:');
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
