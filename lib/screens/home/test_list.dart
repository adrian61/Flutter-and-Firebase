import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestList extends StatefulWidget {
  @override
  _TestListState createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  @override
  Widget build(BuildContext context) {
    final test = Provider.of<QuerySnapshot>(context);
    for(var doc in test.documents){
      print(doc.data);
    }
    return Container();
  }
}
