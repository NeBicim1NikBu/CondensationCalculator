//import 'package:boreas_condensation_calculator/widgets/myAppBar.dart';
import 'dart:async';
import 'package:boreas_condensation_calculator/languages.dart';
import 'package:country_icons/country_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'langselection.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  //Mech Slider values
  double minvalueSliderMech, maxvalueSliderMech, sliderMechValue;
  //Summer and Winter Image Opacity values
  double summerOpacity, winterOpacity;
  //Off Coil Slider values
  double minvalueSliderOffCoil, maxvalueSliderOffCoil, sliderOffCoilValue;
  bool switchValue;
  int selectedTB, divSliderMech, divSliderOffCoil;
  int bottomBarSelectedIndex;
  List<bool> listOfTB;
  String languageSelection = "En";
  Translations myTranslation;
  bool switchLangauge;
  double usaOpacity, trOpacity;
  String languageEnSelected = "True";
  String myMechTempInt, myMechTempDec;

  var textFieldMech = TextEditingController();
  var maskedTextSliderMech = new NumberFormat('##.#');
  //var maskedTextSliderMech =
  //  new MaskTextInputFormatter(mask: '##.#', filter: {"#": RegExp(r'[0-9]')});
  var maskedTextSliderOffCoil = new NumberFormat('##.#');
//var maskedTextSliderOffCoil = new MaskTextInputFormatter(
  //    mask: '+##.#;-##.#', filter: {"#": RegExp(r'[0-9-]')});
  Color myAppColor = Color(0xffff520d);
  @override
  initState() {
    super.initState();
    //Mech Room Slider Set Values
    minvalueSliderMech = 15;
    maxvalueSliderMech = 50;
    sliderMechValue = ((maxvalueSliderMech - minvalueSliderMech) / 2);
    myMechTempInt = sliderMechValue.toStringAsFixed(0);
    myMechTempDec = "0";
    divSliderMech = (maxvalueSliderMech - minvalueSliderMech).toInt();
    //Off Coil Slider Set Values
    minvalueSliderOffCoil = -15;
    maxvalueSliderOffCoil = 20;
    sliderOffCoilValue = ((maxvalueSliderOffCoil - minvalueSliderOffCoil) / 2);
    divSliderOffCoil =
        (200 * (maxvalueSliderOffCoil - minvalueSliderOffCoil)).toInt();
    listOfTB = [true, false, false, false];
    switchValue = false;
    summerOpacity = 1;
    winterOpacity = 0.3;
    bottomBarSelectedIndex = 1;
    usaOpacity = 1;
    trOpacity = 0.3;

    if (languageSelection == "En") {
      myTranslation = new Translations("En");
      switchLangauge = true;
    } else {
      myTranslation = new Translations("Tr");
      switchLangauge = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _onpressedCalculateButton;

    //  Screen size calculation
    var screencalc = MediaQuery.of(context).size;

    return new Scaffold(
      bottomNavigationBar: Container(
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30)),
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              myTranslation.textCalculate,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          onPressed: _onpressedCalculateButton,
        ),
      ),
      appBar: AppBar(
        backgroundColor: myAppColor,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          MyLang(
                              langDatas: myTranslation,
                              curLang: languageSelection,
                              onChanged: (newValue) {
                                setState(() {
                                  languageSelection = newValue;
                                  myTranslation = new Translations(newValue);
                                });
                                print("newValue " + newValue.toString());
                              })
                        ],
                      ),
                      actions: <Widget>[
                        ButtonBar(
                          children: <Widget>[],
                        )
                      ],
                    );
                  });
            },
            icon: Icon(Icons.settings),
            tooltip: "Open settings screen",
            padding: EdgeInsets.all(5),
          ),
        ],
        title: Container(
          width: screencalc.width * 0.5,
          height: kToolbarHeight * 0.9,
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: Image.asset("lib/images/LogoAtTop.png"),
          //
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Color(0xffE5E5E5),
        child: ListView(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                    child: Text(
                  myTranslation.mainTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(height: 10.0),
            // Select Operation Condition Box
            Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    width: 450.0,
                    // height: 150.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                myTranslation.textSelOprCond,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: (switchValue == false)
                                  ? null
                                  : () => setState(
                                        () {
                                          switchValue = false;
                                          summerOpacity = 1.0;
                                          winterOpacity = 0.3;
                                          myAppColor = Color(0xffff520d);
                                        },
                                      ),
                              child: Container(
                                child: Opacity(
                                  opacity: summerOpacity,
                                  child: Image.asset(
                                    "lib/images/summer.png",
                                    scale: 4,
                                    colorBlendMode: BlendMode.darken,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Switch(
                                autofocus: true,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                activeColor: Colors.blue,
                                activeTrackColor: Colors.blue.shade100,
                                inactiveTrackColor: Colors.orange.shade100,
                                inactiveThumbColor: Colors.orange,
                                value: switchValue,
                                onChanged: (newswitchvalue) {
                                  setState(
                                    () {
                                      switchValue = newswitchvalue;
                                      if (newswitchvalue) {
                                        summerOpacity = 0.3;
                                        winterOpacity = 1.0;
                                        myAppColor = Colors.blue;
                                      } else {
                                        summerOpacity = 1.0;
                                        winterOpacity = 0.3;
                                        myAppColor = Color(0xffff520d);
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: (switchValue == true)
                                  ? null
                                  : () => setState(
                                        () {
                                          switchValue = true;
                                          summerOpacity = 0.3;
                                          winterOpacity = 1.0;
                                          myAppColor = Colors.blue;
                                        },
                                      ),
                              child: Container(
                                child: Opacity(
                                  opacity: winterOpacity,
                                  child: Image.asset(
                                    "lib/images/winter.png",
                                    scale: 5,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Empty box
            SizedBox(height: 20.0),
            //Slider Mech Room DB Temp Box
            Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                    width: 450.0,
                    //height: 200.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          //mainAxisSize: MainAxisSize.min,
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              myTranslation.textMechRoomCond,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          //padding: const EdgeInsets.all(8.0),
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                myMechTempInt + "." + myMechTempDec,
                                style: TextStyle(
                                  backgroundColor: Colors.black54,
                                  color: Colors.white70,
                                  fontSize: 24.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 120,
                              width: double.infinity,
                              child: new HorizantalPicker(
                                showCursor: false,
                                suffix: "°C",
                                minValue: 0.0, //minvalueSliderMech,
                                maxValue: 0.9, //maxvalueSliderMech,
                                divisions: 9, //divSliderMech,
                                onChanged: (newValue) {
                                  setState(
                                    () {
                                      myMechTempDec =
                                          ((newValue - newValue.truncate()) *
                                                  10)
                                              .toStringAsFixed(0);
                                      print(myMechTempDec.toString());
                                      // sliderMechValue = newValue;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: 300, //double.infinity,
                              height: 115,
                              //alignment: Alignment.centerLeft,
                              child: new HorizantalPicker(
                                showCursor: false,
                                suffix: "°C",
                                minValue: minvalueSliderMech,
                                maxValue: maxvalueSliderMech,
                                divisions: divSliderMech,
                                onChanged: (newValue) {
                                  setState(
                                    () {
                                      myMechTempInt = (newValue.truncate())
                                          .toStringAsFixed(0);
                                      // sliderMechValue = newValue;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "+15C",
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              child: Slider(
                            min: minvalueSliderMech,
                            max: maxvalueSliderMech,
                            value: sliderMechValue,
                            activeColor: Color(0xffff520d),
                            inactiveColor: Colors.blueGrey,
                            divisions: divSliderMech,
                            label: sliderMechValue.toStringAsFixed(1),
                            onChanged: (newvalue) {
                              setState(() {
                                sliderMechValue = newvalue;

                                //textFieldMech.text = newvalue.toStringAsFixed(1);
                                //print(slidervalue);
                                //print(slidervaluetext);
                              });
                            },
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "+50C",
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            //Slider Off Coil Box
            Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                    width: 450.0,
                    //height: 200.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 320,
                            height: 40,
                            alignment: Alignment.center,
                            child: NumberPicker.horizontal(
                              decoration: BoxDecoration(border: Border.all()),
                              highlightSelectedValue: true,
                              minValue: minvalueSliderOffCoil.toInt(),
                              maxValue: maxvalueSliderOffCoil.toInt(),
                              initialValue: sliderOffCoilValue.toInt(),
                              onChanged: (newvalue) {
                                setState(() {
                                  sliderOffCoilValue =
                                      newvalue.toInt().toDouble();
                                  print(sliderOffCoilValue);
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "-15C",
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              child: Slider(
                            min: minvalueSliderOffCoil,
                            max: maxvalueSliderOffCoil,
                            value: sliderOffCoilValue,
                            activeColor: Color(0xffff520d),
                            inactiveColor: Colors.blueGrey,
                            divisions: divSliderOffCoil,
                            label: sliderOffCoilValue.toStringAsFixed(1),
                            onChanged: (newvalue) {
                              setState(() {
                                sliderOffCoilValue =
                                    newvalue.toInt().toDouble();

                                //maskedTextSliderOffCoil.text =_nwValue;
                                //newvalue.toString();
                                //sliderOffCoilValue = newvalue;
                                //print(_nwValue);
                                //print(slidervaluetext);
                              });
                            },
                          )),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "+20C",
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Title of Thermal Break
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Select your Thermal Break (TB) Class",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            //Thermal Break Selection Box
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: ToggleButtons(
                    isSelected: listOfTB,
                    onPressed: (selectedv) {
                      setState(() {
                        for (var i = 0; i < listOfTB.length; i++) {
                          if (i == selectedv) {
                            listOfTB[i] = true;
                          } else {
                            listOfTB[i] = false;
                          }
                        }
                      });
                    },
                    focusColor: Colors.blue,
                    selectedColor: Colors.white,
                    selectedBorderColor: Colors.blue,
                    highlightColor: Colors.blueGrey,
                    fillColor: Colors.blue,
                    children: <Widget>[
                      Text(
                        "TB1",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "TB2",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "TB3",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "TB4",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Calculate button
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Calculate",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
