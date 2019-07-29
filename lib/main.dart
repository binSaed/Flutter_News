import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/HomeScreen.dart';
import 'package:flutter_app/Screens/OnBoarding.dart';
import 'package:flutter_app/Utilities/GeneralTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool("seen");
  Widget _widget;
  if (seen == false || seen == null) {
    _widget = Onboarding();
  } else {
    _widget = HomeScreen();
  }
  runApp(myApp(_widget));
}

class myApp extends StatelessWidget {
  Widget _splashOrHome;

  myApp(this._splashOrHome);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: GeneralTheme.themeData,
      home: _splashOrHome,
      title: "AbdOo News",
    );
  }
}
