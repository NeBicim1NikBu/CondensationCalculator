class Translations {
  String _language;
  Map<String, Map<String, String>> languageMap = {
    "En": {
      "appTitle": "Boreas Condensation Calculator",
      "mainTitle": "Condensation Calculator"
    },
    "Tr": {
      "appTitle": "Boreas Yoğuşma Hesabı",
      "mainTitle": "Yoğuşma Hesabı",
    },
  };

  String _appTitle(_language) {
    return languageMap[_language]["appTitle"];
  }

  String get appTitle => _appTitle(_language);
  set appTitle(String value){languageMap[_language]["appTitle"]=value;}

  String _mainTitle(_language) {
    return languageMap[_language]["mainTitle"];
  }

    String get mainTitle => _mainTitle(_language);
  set mainTitle(String value){languageMap[_language]["mainTitle"]=value;}

  Translations(String language) {
    this._language = language;
    this._appTitle(language);
    this._mainTitle(language);
  }
}
