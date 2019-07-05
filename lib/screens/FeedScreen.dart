import 'package:flutter/material.dart';
import 'package:fosslclient/MenuBuilder.dart';
import 'package:fosslclient/Styles.dart';
import 'package:fosslclient/Widgets/Rant.dart';
import 'package:fosslclient/devrant/API.dart';
import 'package:fosslclient/devrant/Rant.dart';

class FeedScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FeedState();
  }
}

class FeedState extends State<FeedScreen> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: API().getFeed(0),
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
              itemCount: snapshot.data["rants"].length,
              itemBuilder: (BuildContext context, int index) {
                return RantWidget(new Rant(snapshot.data["rants"][index]))
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
