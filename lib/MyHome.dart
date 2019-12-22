//import 'package:boreas_condensation_calculator/widgets/myAppBar.dart';
import 'dart:async';
import 'package:boreas_condensation_calculator/languages.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:numberpicker/numberpicker.dart';

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
  String languageSelection = "Tr";
  Translations myTranslation;

  var textFieldMech = TextEditingController();
  var maskedTextSliderMech = new NumberFormat('##.#');
  //var maskedTextSliderMech =
  //  new MaskTextInputFormatter(mask: '##.#', filter: {"#": RegExp(r'[0-9]')});
  var maskedTextSliderOffCoil = new NumberFormat('##.#');
//var maskedTextSliderOffCoil = new MaskTextInputFormatter(
  //    mask: '+##.#;-##.#', filter: {"#": RegExp(r'[0-9-]')});

  @override
  initState() {
    super.initState();
    //Mech Room Slider Set Values
    minvalueSliderMech = 15;
    maxvalueSliderMech = 50;
    sliderMechValue = ((maxvalueSliderMech - minvalueSliderMech) / 2);
    divSliderMech = (200 * (maxvalueSliderMech - minvalueSliderMech)).toInt();
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
    if (languageSelection == "En") {
      myTranslation = new Translations("En");
    } else {
      myTranslation = new Translations("Tr");
    }
  }

  Future<String> createSettingsDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Program Settings",
            textAlign: TextAlign.center,
          ),
          content: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      width: 450,
                      height: 150,
                      child: Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Text("Select Lanaguage")
                          ],),
                          Row(
                            children: <Widget>[
                              Switch(
                                value: true,
                                onChanged: (bool newvalue) {},
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text("Submit"),
              onPressed: () {
                Navigator.of(context).pop(customController.text.toString());
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var _onpressedCalculateButton;

    if (switchValue) {
      _onpressedCalculateButton = () {
        print(myTranslation.appTitle);
      };
    }
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
              "Calculate",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          onPressed: _onpressedCalculateButton,
        ),
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              createSettingsDialog(context);
            },
            icon: Icon(Icons.settings),
            tooltip: "Open settings screen",
            padding: EdgeInsets.all(5),
          )
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
                    width: 450.0,
                    height: 150.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(
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
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Select Operation Condition",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Switch(
                                  autofocus: true,
                                  activeColor: Colors.blue,
                                  activeTrackColor: Colors.blue.shade100,
                                  inactiveTrackColor: Colors.orange.shade100,
                                  inactiveThumbColor: Colors.orange,
                                  value: switchValue,
                                  onChanged: (newswitchvalue) {
                                    setState(() {
                                      switchValue = newswitchvalue;
                                      if (newswitchvalue) {
                                        summerOpacity = 0.3;
                                        winterOpacity = 1.0;
                                      } else {
                                        summerOpacity = 1.0;
                                        winterOpacity = 0.3;
                                      }

                                      print(switchValue.toString());
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
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
                    margin: EdgeInsets.all(5),
                    width: 450.0,
                    //height: 200.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            height: 70,
                            alignment: Alignment.centerLeft,
                            child: new NumberPicker.decimal(
                              decoration: new BoxDecoration(
                                border: new Border(
                                  right: new BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.grey.shade300,
                                  ),
                                  left: new BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.grey.shade300),
                                  top: new BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.blue,
                                  ),
                                  bottom: new BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              listViewWidth: 30,
                              itemExtent: 22,
                              minValue: minvalueSliderMech.toInt(),
                              maxValue: maxvalueSliderMech.toInt(),
                              initialValue: sliderMechValue,
                              onChanged: (newvalue) {
                                print(newvalue);
                                setState(() {
                                  sliderMechValue = newvalue;
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
