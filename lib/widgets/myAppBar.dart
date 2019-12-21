import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  // variables
  final List<String> myList = [
    "bir",
    "iki",
    "uc",
    "dort",
    "bir",
    "iki",
    "uc",
    "dort",
    "bir",
    "iki",
    "uc",
    "dort",
    "bir",
    "iki",
    "uc",
    "dort"
  ];
  // func

  // build

  @override
  Widget build(BuildContext context) {
    // Screen size calculation
    var screencalc = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // gradient: LinearGradient(colors: [Colors.black,Colors.white],begin:Alignment.topCenter,end: Alignment.bottomCenter ),
        color: Colors.grey.shade400,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Align(child: Image.asset("assets/boreas_logo.png",height: screencalc.height*(1/15),),alignment: Alignment.centerRight,),
            flex: 2,
          ),
          SizedBox(width: screencalc.width*(1/20)),
          Expanded(
            child: Text("BOREAS",style:TextStyle(fontSize: 36,fontWeight: FontWeight.w700) ,),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
