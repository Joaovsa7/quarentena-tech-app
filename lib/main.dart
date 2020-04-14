import 'package:Quarentena_Tech/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        buttonColor: hexToColor('#F25A70'),
        fontFamily: 'PressStart2P',
      ),
      home: HomePage(),
    );
  }
}
