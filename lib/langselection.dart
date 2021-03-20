import 'package:flutter/material.dart';
import 'package:boreas_condensation_calculator/languages.dart';

class MyLang extends StatefulWidget {
  final String curLang;
  final langDatas;
  final void Function(String) onChanged;
  MyLang({this.curLang, this.langDatas, this.onChanged});

  @override
  _MyLangState createState() => _MyLangState();
}

class _MyLangState extends State<MyLang> {
  bool isTurkish;
  Translations translation;
  // fs

  // init
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    translation = widget.langDatas;
    setState(() {
      isTurkish = (widget.curLang == "En") ? false : true;
      if (isTurkish == true) {
        translation = new Translations("Tr");
        //  switchLangauge = true;
      } else {
        translation = new Translations("En");
        // switchLangauge = false;
      }
    });

    // print(isTurkish.toString());
  }
  // build

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                child: Opacity(
                  opacity: isTurkish == true ? 1 : 0.5,
                  child: Image.asset(
                    'icons/flags/png/tr.png',
                    package: 'country_icons',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                onTap: (isTurkish == true)
                    ? null
                    : () => setState(
                          () {
                            isTurkish = true;
                            translation = new Translations("Tr");
                            widget.onChanged((isTurkish == true) ? "Tr" : "En");
                          },
                        ),
              ),
              Switch(
                value: !isTurkish,
                onChanged: (newValue) {
                  //print(newValue.toString());
                  setState(() {
                    isTurkish = !newValue;
                    if (isTurkish == true) {
                      translation = new Translations("Tr");
                      //  switchLangauge = true;
                    } else {
                      translation = new Translations("En");
                      // switchLangauge = false;
                    }
                  });

                  widget.onChanged((isTurkish == true) ? "Tr" : "En");
                },
              ),
              GestureDetector(
                  child: Opacity(
                    opacity: isTurkish == false ? 1 : 0.5,
                    child: Image.asset(
                      'icons/flags/png/us.png',
                      package: 'country_icons',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  onTap: (isTurkish == false)
                      ? null
                      : () => setState(() {
                            isTurkish = false;
                            translation = new Translations("En");
                            widget.onChanged("En");
                          })),
            ],
          ),
          FlatButton(
            child: Text(translation.submitTitle),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
