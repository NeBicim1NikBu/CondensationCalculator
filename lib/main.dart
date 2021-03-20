import 'package:boreas_condensation_calculator/MyHome.dart';
import 'package:flutter/material.dart';
import 'package:boreas_condensation_calculator/languages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  Translations myTranslation=new Translations("Tr");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: myTranslation.appTitle,
      theme: ThemeData(
        primaryColor: Color(0xffff520d),

      ),
      home: MyHome(),
    );
  }
}
