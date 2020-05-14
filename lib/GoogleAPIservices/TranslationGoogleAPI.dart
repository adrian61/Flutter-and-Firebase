import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import 'ParseTranslationFromGoogleAPI.dart';

class TranslationGoogleAPI {
  String _textToTranslate;
  String _countryCodeSource;
  String _translatedText;
  String _countryCodeTarget;
  String _API = '-vflk';
  var _baseUrl = 'https://translation.googleapis.com/language/translate/v2/?q=';

  TranslationGoogleAPI(String textToTranslate, String countryCodeSource,
      String countryCodeTarget) {
    this._textToTranslate = textToTranslate;
    this._countryCodeTarget = countryCodeTarget;
    this._countryCodeSource = countryCodeSource;
    this._translatedText = "test";
  }

  Future<String> translateWord() async {
    final response = await http.get(_baseUrl +
        _textToTranslate +
        "&source=" +
        _countryCodeSource +
        "&target=" +
        _countryCodeTarget +
        "&key=" +
        _API);
    if (response.statusCode == 200) {
      ParseTranslationFromGoogleAPI a =
          ParseTranslationFromGoogleAPI.fromJson(json.decode(response.body));
      this._translatedText = a.toString();
      this._translatedText = _translatedText.substring(
          1, _translatedText.length - 1); // delete  signs: []
      return _translatedText;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
