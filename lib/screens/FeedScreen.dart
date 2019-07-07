import 'package:flutter/material.dart';
import 'package:fosslclient/MenuBuilder.dart';
import 'package:fosslclient/Styles.dart';
import 'package:fosslclient/Widgets/RantWidget.dart';
import 'package:fosslclient/devrant/Rant.dart';

import '../devrant/DevRant.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen() {
    DevRant devRant = new DevRant();
    devRant.init();
  }
  @override
  State<StatefulWidget> createState() {
    return FeedState();
  }
}

class FeedState extends State<FeedScreen> {
  int refreshed = 0;
  int skip = 0;

  var rants = [];

  Future<dynamic> fetchRantFeed() async {
    var dR = new DevRant();
    await dR.init();
    if (!dR.loggedIn) {
      await dR.login("USERNAME", "DIDYOUREALLYBELIEVEWHATICOMMITEDWASMYPASSWORD!? You, my friend have been trolled. I'd never use such an insecure password");
    }
    var feed = await dR.getRantFeed(
        skip: skip,
        hideReposts: true,
        sortBy: SortBy.TOP,
        postRange: PostRange.WEEK,
        filter: [
          FilterOptions.DEVRANT,
          FilterOptions.RANTS,
          FilterOptions.RANDOM
        ]);
    rants.addAll(feed);
    return feed;
  }

  Future<void> refreshHandler() async {
    setState(() {
      refreshed++;
      skip = 0;
      rants = [];
    });
  }

  Future<void> fetchMoreFeed() async {
    skip = rants.length;
    await fetchRantFeed();
    setState(() {
    });
    return rants;
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
            child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {

            }
            return true;
          },
          child: RefreshIndicator(
            onRefresh: refreshHandler,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: rants.length+1,
              itemBuilder: (BuildContext context, int index) {
                if(index >= rants.length){
                  return FutureBuilder<dynamic> (
                    future: fetchMoreFeed(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        if(rants.length > index){
                          return Container(
                            child: RantWidget(new Rant.fromJSON(rants[index])),
                          );
                        }
                        return Card(
                          child: Center(
                            child: Text(
                              "No more rants",
                            ),
                          ),
                        );
                      }
                      return Card(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  );
                }

                //The Container is only there because RantWidget is a StatefulWidget that does therefore not have a build method.
                return Container(
                  child: RantWidget(new Rant.fromJSON(rants[index])),
                );
              },
            ),
          ),
        )),
      );
    }

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
