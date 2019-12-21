import 'package:boreas_condensation_calculator/MyHome.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BOREAS Condensation Calculator',
      theme: ThemeData(
        primaryColor: Color(0xffff520d),

      ),
      home: MyHome(),
    );
  }
}
