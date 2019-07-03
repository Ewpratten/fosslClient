import 'package:flutter/material.dart';
import 'package:fosslclient/Styles.dart';
import 'package:fosslclient/devrant/CurrentUser.dart';
import 'package:fosslclient/screens/FeedScreen.dart';
import 'package:fosslclient/screens/NewRantScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "fosslClient",
      theme: ThemeData(
          backgroundColor: bg_color,
          accentColor: bg_color,
          primaryColor: bg_color,
          dialogBackgroundColor: bg_color),
      home: Scaffold(
        // backgroundColor: mg_color,
        appBar: AppBar(
          title: Text("fosslClient"),
          backgroundColor: bg_color,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print("new rant");
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: new Text("ewpratten"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: hl_color,
                  child: Text(CurrentUser()
                      .getInstance()
                      .name
                      .substring(0, 1)
                      .toUpperCase()),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: FlatButton.icon(
                    icon: Icon(Icons.list),
                    label: Text(
                      "Feed",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: FlatButton.icon(
                    icon: Icon(Icons.notifications),
                    label: Text(
                      "Notifs",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: FlatButton.icon(
                    icon: Icon(Icons.calendar_today),
                    label: Text(
                      "Weekly Rant",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: FlatButton.icon(
                    icon: Icon(Icons.search),
                    label: Text(
                      "Search",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text(
                      "Profile",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: FlatButton.icon(
                    icon: Icon(Icons.settings),
                    label: Text(
                      "Settings",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                  )),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: hl_color,
        //   child: Icon(Icons.add),
        //   onPressed: () {
        //     // new rant
        //     // TextInputAction(context).
        //     // Navigator.of(context).pop();
        //     // Navigator.push(
        //     //     context,
        //     //     MaterialPageRoute(
        //     //         builder: (BuildContext context) => NewRantScreen()));
        //     // final ctx = navigatorKey.currentState.overlay.context;
        //     // showDialog(
        //     //   context: ctx,
        //     //   builder: (context){
        //     //     return AlertDialog(
        //     //       content: NewRantScreen(),
        //     //     );
        //     //   }
        //     // );

        // },
        // ),
        body: FeedScreen(),
      ),
    );
  }
}
