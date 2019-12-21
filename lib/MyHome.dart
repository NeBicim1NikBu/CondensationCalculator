//import 'package:boreas_condensation_calculator/widgets/myAppBar.dart';
import 'dart:async';

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
  double minvalueSliderMech,
      maxvalueSliderMech,
      sliderMechValue;
  //Summer and Winter Image Opacity values
   double summerOpacity,
      winterOpacity;
  //Off Coil Slider values
  double minvalueSliderOffCoil, maxvalueSliderOffCoil, sliderOffCoilValue;
  bool switchValue;
  int selectedTB, divSliderMech, divSliderOffCoil;
  List<bool> listOfTB;

  var textFieldMech = TextEditingController();
  var maskedTextSliderMech = new NumberFormat('##.#');
  //var maskedTextSliderMech =
  //  new MaskTextInputFormatter(mask: '##.#', filter: {"#": RegExp(r'[0-9]')});
  var maskedTextSliderOffCoil = new NumberFormat('##.#');
//var maskedTextSliderOffCoil = new MaskTextInputFormatter(
  //    mask: '+##.#;-##.#', filter: {"#": RegExp(r'[0-9-]')});
  var key =GlobalKey<ScaffoldState>();

  @override
  void initState() {
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
  }

  @override
  Widget build(BuildContext context) {
    var mypicker= new Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(begin: 0, end: 999),
          NumberPickerColumn(begin: 100, end: 200),
        ]),
        delimiter: [
          PickerDelimiter(child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ))
        ],
        hideHeader: true,
        title: new Text("Please Select"),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    );
    // Screen size calculation
    var screencalc = MediaQuery.of(context).size;

    return new Scaffold(
      key: key,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(100.0),
          child: FittedBox(
            child: Image.asset("lib/images/LogoAtTop.png"),
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Color(0xffE5E5E5),
        child: ListView(
          children: <Widget>[
           RaisedButton(
             child: Text("data"),
             onPressed: (){
               mypicker.show(key.currentState);
             },
           ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                    child: Text(
                  "Condensation Calculator",
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
                    width: 450.0,
                    height: 200.0,
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
                    height: 200.0,
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
                        Padding(
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
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
