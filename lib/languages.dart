class Translations {
  String _language;
  Map<String, Map<String, String>> languageMap = {
    "En": {
      "appTitle": "Boreas Condensation Calculator",
      "mainTitle": "Condensation Calculator",
      "textSelOprCond": "Select Operation Condition",
      "textCalculate": "Calculate"
    },
    "Tr": {
      "appTitle": "Boreas Yoğuşma Hesabı",
      "mainTitle": "Yoğuşma Hesabı",
      "textSelOprCond": "Çalışma Koşulunu Seçiniz",
      "textCalculate": "Hesapla"
    },
  };

  String get appTitle => languageMap[_language]["appTitle"];
  set appTitle(String value) {
    languageMap[_language]["appTitle"] = value;
  }

  String get mainTitle => languageMap[_language]["mainTitle"];
  set mainTitle(String value) {
    languageMap[_language]["mainTitle"] = value;
  }

  String get textSelOprCond => languageMap[_language]["textSelOprCond"];
  set textSelOprCond(String value) {
    languageMap[_language]["textSelOprCond"] = value;
  }
    String get textCalculate => languageMap[_language]["textCalculate"];
  set textCalculate(String value) {
    languageMap[_language]["textCalculate"] = value;
  }


  Translations(String language) {
    this._language = language;
    this.appTitle;
    this.mainTitle;
    this.textSelOprCond;
  }
}
