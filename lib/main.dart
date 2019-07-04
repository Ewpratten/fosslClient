import 'package:flutter/material.dart';
import 'package:fosslclient/MenuBuilder.dart';
import 'package:fosslclient/Styles.dart';
import 'package:fosslclient/devrant/CurrentUser.dart';
import 'package:fosslclient/screens/FeedScreen.dart';
import 'package:fosslclient/screens/NewRantScreen.dart';
import 'package:fosslclient/screens/WeeklyScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "fosslClient",
      theme: ThemeData(
          backgroundColor: bg_color,
          accentColor: bg_color,
          primaryColor: bg_color,
          dialogBackgroundColor: bg_color),
      home: new MyAppHome(),
    );
  }
}

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FeedScreen();
  }
}
