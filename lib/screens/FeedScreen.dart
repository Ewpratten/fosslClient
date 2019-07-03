import 'package:flutter/material.dart';
import 'package:fosslclient/Widgets/Rant.dart';
import 'package:fosslclient/devrant/Rant.dart';
import 'package:fosslclient/main.dart';

class FeedScreen extends StatefulWidget {
  bool has_loaded = false;

  @override
  State<StatefulWidget> createState() {
    return FeedState();
  }
}

class FeedState extends State<FeedScreen> {
  
  @override
  Widget build(BuildContext context) {

    // overflow prevention hack
    double c_width = MediaQuery.of(context).size.width*0.8;

    return Container(
      child: RantWidget(new Rant({"body":"Welcome to fosslClient!\nThis is a custom devRant client built on Flutter by members of the FOSS/L group.", "tags":["1", "2", "3"], "score":21, "user_username":"ewpratten"})).build(c_width),
      // child: ListView.builder(
      //   itemBuilder: (BuildContext ctxt, int index) {
      //     return new RantWidget({"body":"test", "tags":["1", "2", "3"]}).build();
      //   },
      //   itemCount: 1)
    );
  }
}
