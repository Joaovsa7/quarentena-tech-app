import 'package:Quarentena_Tech/services/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:Quarentena_Tech/screens/about.dart';
import 'package:Quarentena_Tech/screens/homepage.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class QuarentenaTech extends StatefulWidget {
  @override
  _QuarentenaTechState createState() => _QuarentenaTechState();
}

class _QuarentenaTechState extends State<QuarentenaTech> {
  final Color mainColor = hexToColor('#F25A70');
  final SharedPref _sharedPref = new SharedPref();
  bool redirect = false;

  void redirectUser() async {
    var sharedPref = await _sharedPref.read('redirect');
    if (sharedPref) {
      setState(() {
        redirect = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    redirectUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        iconTheme: IconThemeData(
          color: mainColor,
        ),
        textTheme: TextTheme(
          body1: TextStyle(color: mainColor),
        ),
        buttonColor: mainColor,
        fontFamily: 'PressStart2P',
      ),
      home: redirect ? HomePage() : About(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}
