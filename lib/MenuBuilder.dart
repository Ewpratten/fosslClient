import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fosslclient/Styles.dart';
import 'package:fosslclient/devrant/CurrentUser.dart';
import 'package:fosslclient/screens/FeedScreen.dart';
import 'package:fosslclient/screens/WeeklyScreen.dart';

class MenuBuilder {
  // Method to build the side menu
  Widget build(BuildContext context) {
    return Drawer(
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
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeedScreen()));
                },
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
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WeeklyScreen()));
                },
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
    );
  }
}
