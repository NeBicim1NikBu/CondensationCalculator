class Translations {
  String _language;
  Map<String, Map<String, String>> languageMap = {
    "En": {
      "appTitle": "Boreas Condensation Calculator",
      "mainTitle": "Condensation Calculator",
      "textSelOprCond": "Operating Condition",
      "textCalculate": "Calculate",
      "submit": "Submit",
      "textMechRoomCond": "Mechanical Room DB Temperature",
    },
    "Tr": {
      "appTitle": "Boreas Yoğuşma Hesabı",
      "mainTitle": "Yoğuşma Hesabı",
      "textSelOprCond": "Çalışma Koşulunu",
      "textCalculate": "Hesapla",
      "submit": "Onay",
      "textMechRoomCond": "Mekanik Oda KT Sıcaklığı",
    },
  };

  String get appTitle => languageMap[_language]["appTitle"];
  set appTitle(String value) {
    languageMap[_language]["appTitle"] = value;
  }

  String get submitTitle => languageMap[_language]["submit"];
  set submitTitle(String value) {
    languageMap[_language]["submit"] = value;
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
  
  String get textMechRoomCond => languageMap[_language]["textMechRoomCond"];
  set textMechRoomCond(String value) {
    languageMap[_language]["textMechRoomCond"] = value;
  }

  Translations(String language) {
    this._language = language;
    this.appTitle;
    this.mainTitle;
    this.textSelOprCond;
  }
}
