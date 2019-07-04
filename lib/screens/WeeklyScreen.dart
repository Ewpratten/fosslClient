import 'package:flutter/material.dart';
import 'package:fosslclient/MenuBuilder.dart';
import 'package:fosslclient/Styles.dart';
import 'package:fosslclient/Widgets/Rant.dart';
import 'package:fosslclient/devrant/API.dart';
import 'package:fosslclient/devrant/Rant.dart';

class WeeklyScreen extends StatefulWidget {
  bool has_loaded = false;

  @override
  State<StatefulWidget> createState() {
    return WeeklyState();
  }
}

class WeeklyState extends State<WeeklyScreen> {
  bool is_ready = false;
  bool load_latch = false;
  dynamic news;

  void loadRants() async {
    news = await API().getFeed(0);
    news = news["news"];
    setState(() {
      is_ready = true;
    });
  }

  @override
  void dispose() {
    load_latch = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // overflow prevention hack
    double c_width = MediaQuery.of(context).size.width;

    if (!load_latch) {
      loadRants();
      load_latch = true;
    }

    if (is_ready) {
      return Scaffold(
          // backgroundColor: mg_color,
          appBar: AppBar(
            title: Text("fosslClient"),
            backgroundColor: bg_color,
          ),
          drawer: MenuBuilder().build(context),
          body: Container(
            width: c_width,
        // child: Flexible(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                news["headline"],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(news["body"]),
              Text(
                news["footer"],
                style: TextStyle(
                  color: Colors.grey,
                ),
              
              ),
              Text("                                                             "),
            ],
          ),
        ),
          ),
        );
      
      

        // child: RantWidget(new Rant({
        //   "body":
        //       "Welcome to fosslClient!\nThis is a custom devRant client built on Flutter by members of the FOSS/L group.",
        //   "tags": ["1", "2", "3"],
        //   "score": 21,
        //   "user_username": "ewpratten"
        // })).build(c_width),
        // child: ListView.builder(
        //   itemBuilder: (BuildContext ctxt, int index) {
        //     return new RantWidget({"body":"test", "tags":["1", "2", "3"]}).build();
        //   },
        //   itemCount: 1)
        // ),
      // );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
