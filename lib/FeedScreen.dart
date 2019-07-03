import 'package:flutter/material.dart';
import 'package:fosslclient/main.dart';

class FeedScreen extends StatefulWidget {
  bool has_loaded = false;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FeedState();
  }
}

class FeedState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Feed"),
    );
  }
}
