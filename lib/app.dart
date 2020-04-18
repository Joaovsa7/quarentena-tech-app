import 'package:Quarentena_Tech/services/sharedPref.dart';
import 'package:Quarentena_Tech/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:Quarentena_Tech/screens/about.dart';
import 'package:Quarentena_Tech/screens/homepage.dart';

class QuarentenaTech extends StatefulWidget {
  @override
  _QuarentenaTechState createState() => _QuarentenaTechState();
}

class _QuarentenaTechState extends State<QuarentenaTech> {
  final SharedPref _sharedPref = new SharedPref();
  bool darkMode = false;
  bool redirect = false;

  void redirectUser() async {
    var redirectState = await _sharedPref.read('redirect');
    if (redirectState) {
      setState(() {
        redirect = true;
      });
    }
  }

  void getDarkModeStateInSharedPref() async {
    var darkModeState = await _sharedPref.read('darkMode');
    if (darkModeState) {
      setState(() {
        darkMode = darkModeState;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    redirectUser();
    getDarkModeStateInSharedPref();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void handleTheme(bool value) async {
    await _sharedPref.save('redirect', value);
    setState(() {
      darkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = darkMode == true ? themes['dark'] : themes['default'];
    return MaterialApp(
      title: 'Quarentena Tech',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: redirect
          ? HomePage(
              handleTheme: handleTheme,
              darkModeState: darkMode,
            )
          : About(),
      routes: {
        '/home': (context) => HomePage(
              handleTheme: handleTheme,
              darkModeState: darkMode,
            ),
      },
    );
  }
}
