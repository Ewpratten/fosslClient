import 'package:flutter/material.dart';
import 'package:fosslclient/Widgets/RantWidget.dart';
import 'package:fosslclient/devrant/Rant.dart';
import 'package:fosslclient/main.dart';

import '../devrant/DevRant.dart';

class NewRantScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewRantState();
  }
}

class NewRantState extends State<NewRantScreen> {
  var bodyTextController = TextEditingController();
  var tagsTextController = TextEditingController();

  @override
  void dispose() {
    // bodyTextController.dispose();
    // tagsTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          TextField(
            autocorrect: true,
            controller: bodyTextController,
          ),
          TextField(
            autocorrect: true,
            controller: tagsTextController,
          ),
          FlatButton(
            child: Text("Post Rant"),
            onPressed: () async{
              var d = new DevRant();
              await d.init();
              d.postRant(body: bodyTextController.text, tags: tagsTextController.text);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
