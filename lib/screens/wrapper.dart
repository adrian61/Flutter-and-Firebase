import 'package:flutter/material.dart';
import 'package:flutterprojects/screens/authenticate/atuhenticate.dart';
import 'package:flutterprojects/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either Home or Authenticate widget
    return Authenticate();
  }
}
