import 'package:flutter/material.dart';
import 'package:flutterprojects/models/translation.dart';
import 'package:provider/provider.dart';
import 'package:flutterprojects/screens/home/translation_tile.dart';

class TranslationList extends StatefulWidget {
  @override
  _TranslationListState createState() => _TranslationListState();
}

class _TranslationListState extends State<TranslationList> {
  @override
  Widget build(BuildContext context) {
    final translations = Provider.of<List<Translation>>(context);
    translations.forEach((_t) {
      print(_t.name);
      print(_t.translationMap.toString());
      print(_t.counter.toString());
    });
    return ListView.builder(itemCount: translations.length,
      itemBuilder: (context, index) {
        return TranslationTile(translation: translations[index]);
      },);
  }
}


