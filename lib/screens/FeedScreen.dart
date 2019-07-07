import 'package:flutter/material.dart';
import 'package:fosslclient/MenuBuilder.dart';
import 'package:fosslclient/Styles.dart';
import 'package:fosslclient/Widgets/Rant.dart';
import 'package:fosslclient/devrant/API.dart';
import 'package:fosslclient/devrant/Rant.dart';

import '../devrant/DevRant.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen(){
    DevRant devRant = new DevRant();
    devRant.init();
  }
  @override
  State<StatefulWidget> createState() {
    return FeedState();
  }
}

class FeedState extends State<FeedScreen> {

  Future<dynamic> fetchRantFeed() async{
    var dR = new DevRant();
    await dR.init();
    var feed = await dR.getRantFeed(
        hideReposts: true,
        sortBy: SortBy.TOP,
        postRange: PostRange.WEEK,
        filter: [
          FilterOptions.DEVRANT,
          FilterOptions.RANTS,
          FilterOptions.RANDOM
        ]
    );
    print("Feed: " + feed.toString());
    return feed;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: fetchRantFeed(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, dynamic snapshot) {
    if (snapshot.hasData) {
      return Scaffold(
        // backgroundColor: mg_color,
        appBar: AppBar(
          title: Text("fosslClient"),
          backgroundColor: bg_color,
        ),
        drawer: MenuBuilder().build(context),
        floatingActionButton: FloatingActionButton(
          backgroundColor: hl_color,
          child: Icon(Icons.add),
          onPressed: () {
            // new rant
            // TextInputAction(context).
            // Navigator.of(context).pop();
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => NewRantScreen()));
            // final ctx = navigatorKey.currentState.overlay.context;
            // showDialog(
            //   context: ctx,
            //   builder: (context){
            //     return AlertDialog(
            //       content: NewRantScreen(),
            //     );
            //   }
            // );
          },
        ),
        body: Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int indexxxx) {
                return RantWidget(new Rant(snapshot.data[indexxxx]))
                    .build(context);
              },
            )),
      );
    }

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
