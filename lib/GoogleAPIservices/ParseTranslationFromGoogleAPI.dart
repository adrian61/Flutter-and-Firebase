class ParseTranslationFromGoogleAPI {
  Data _data;

  parseTranslationFromGoogleAPI({Data data}) {
    this._data = data;
  }

  Data get data => _data;

  set data(Data data) => _data = data;

  ParseTranslationFromGoogleAPI.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return _data.toString();
  }
}

class Data {
  List<Translations> _translations;

  Data({List<Translations> translations}) {
    this._translations = translations;
  }

  List<Translations> get translations => _translations;

  set translations(List<Translations> translations) =>
      _translations = translations;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['translations'] != null) {
      _translations = new List<Translations>();
      json['translations'].forEach((v) {
        _translations.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._translations != null) {
      data['translations'] = this._translations.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return _translations.toString();
  }
}

class Translations {
  String _translatedText;

  Translations({String translatedText}) {
    this._translatedText = translatedText;
  }

  String get translatedText => _translatedText;

  set translatedText(String translatedText) => _translatedText = translatedText;

  Translations.fromJson(Map<String, dynamic> json) {
    _translatedText = json['translatedText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['translatedText'] = this._translatedText;
    return data;
  }

  @override
  String toString() {
    return _translatedText;
  }
}
