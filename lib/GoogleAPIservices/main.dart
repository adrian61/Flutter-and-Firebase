import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'GoogleAPIservices/TranslationGoogleAPI.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  var _eNWords = <WordsWithTranslation>[];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 100; i++) {
      Random rnd = new Random();
      _eNWords.add(WordsWithTranslation(nouns[rnd.nextInt(nouns.length)]));
    }

    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_eNWords[index].toString()),
        );
      },
    );
  }
}

class WordsWithTranslation {
  String englishWord;
  String translatedWord;

  WordsWithTranslation(String wordInEnglish) {
    this.englishWord = wordInEnglish;
    translateWord(wordInEnglish);
  }

  Future<void> translateWord(String wordInEnglish) async {
    TranslationGoogleAPI translation =
    TranslationGoogleAPI(wordInEnglish, "en", "pl");
    this.translatedWord = await translation.translateWord();
    //print(this.translatedWord);
  }

  @override
  String toString() {
    return 'englishWord: $englishWord, translatedWord: $translatedWord';
  }
}
