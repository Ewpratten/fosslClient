import 'package:flutter/material.dart';
import 'package:fosslclient/devrant/Rant.dart';

import '../devrant/DevRant.dart';

class RantWidget {
  Rant rant;

  RantWidget(Rant rant) {
    this.rant = rant;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Card(
        child: Row(
          children: <Widget>[
            // VOTE BUTTONS
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(left: 5),
              child: Column(
                children: <Widget>[
                  //Upvote
                  InkWell(
                    onDoubleTap: () {
                        new DevRant().voteRant(rant.id, 1).catchError((e) {
                          print(e.errMsg);
                        });
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 2.5),
                        child: new Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue
                        ),
                        padding: const EdgeInsets.all(2),
                      ),
                    ),
                  ),
                  // Score
                  Text(
                      rant.score.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  // Downvote
                  InkWell(
                    onDoubleTap: () {
                      new DevRant().voteRant(rant.id, -1).catchError((e) {
                        print(e.errMsg);
                      });
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 2.5),
                        child: new Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue
                        ),
                        padding: const EdgeInsets.all(2),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            // RIGHT SIDE, USERNAME + RANT + TAGS
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // USERNAME
                        Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            rant.username,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Monospace'),
                          ),
                        ),
                        // RANT
                        Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            rant.body,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 10,
                          ),
                        ),
                        // TAGS
                        Container(
                          child: Text(
                            rant.getTags(),
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
