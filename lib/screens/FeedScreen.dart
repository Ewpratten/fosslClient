import 'package:flutter/material.dart';
import 'package:fosslclient/MenuBuilder.dart';
import 'package:fosslclient/Styles.dart';
import 'package:fosslclient/Widgets/Rant.dart';
import 'package:fosslclient/devrant/API.dart';
import 'package:fosslclient/devrant/Rant.dart';

class FeedScreen extends StatefulWidget {
  bool has_loaded = false;

  @override
  State<StatefulWidget> createState() {
    return FeedState();
  }
}

class FeedState extends State<FeedScreen> {
  bool is_ready = false;
  bool load_latch = false;
  dynamic rants;

  void loadRants() async {
    rants = await API().getFeed(0);
    rants = rants["rants"];
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
    double c_width = MediaQuery.of(context).size.width * 0.8;

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
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: RantWidget(new Rant(rants[index])).build(c_width),
          );
        },
      )
          ),
        );
      
      
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
