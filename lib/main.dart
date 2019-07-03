import 'package:flutter/material.dart';
import 'package:fosslclient/FeedScreen.dart';
import 'package:fosslclient/Styles.dart';
import 'package:fosslclient/devrant/CurrentUser.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        appBar: AppBar(
          title: Text("fosslClient"),
          backgroundColor: bg_color,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              // UserAccountsDrawerHeader(
              //   accountName: new Text("ewpratten"),
              //   currentAccountPicture: CircleAvatar(
              //     backgroundColor: hl_color,
              //     child: Text(CurrentUser()
              //         .getInstance()
              //         .name
              //         .substring(0, 1)
              //         .toUpperCase()),
              //   ),
              // ),
              Container(
                child: Center(
                  child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          child: CircleAvatar(
                            backgroundColor: hl_color,
                            child: Text(CurrentUser()
                                .getInstance()
                                .name
                                .substring(0, 1)
                                .toUpperCase()),
                          ),
                        )
                      ],
                    ), 
                    Column(
                      children: <Widget>[
                              Text(CurrentUser().getInstance().name),
                              Text(CurrentUser().getInstance().getScoreString()),
                      ],
                    )
                    ],
                  ),
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
                    onPressed: (){

                    },
                  )
                  ),
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
                    onPressed: (){

                    },
                  )
                  ),
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
        body: FeedScreen(),
      ),
    );
  }
}
