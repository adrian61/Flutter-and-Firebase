import 'package:flutter/material.dart';
import 'package:flutterprojects/models/user.dart';
import 'package:flutterprojects/screens/authenticate/authenticate.dart';
import 'package:flutterprojects/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return either Home or Authenticate widget

    if (user != null) {
      return Home();
    } else {
      return Authenticate();
    }
  }
}
