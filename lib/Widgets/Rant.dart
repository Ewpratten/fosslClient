import 'package:flutter/material.dart';
import 'package:fosslclient/devrant/Rant.dart';

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
              //TODO: remove this media query, when I find what causes those huge margins
              width: MediaQuery.of(context).size.width/6,
              child: Column(
                children: <Widget>[
                  //Upvote
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    splashColor: Colors.blueAccent,
                    shape: CircleBorder(),
                    onPressed: () {
                      rant.vote(1);
                    },
                    child: Text(
                      "++",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  // Score
                  Text(rant.score.toString()),
                  // Downvote
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    splashColor: Colors.blueAccent,
                    shape: CircleBorder(),
                    onPressed: () {
                      rant.vote(-1);
                    },
                    child: Text(
                      "--",
                      style: TextStyle(fontSize: 15.0),
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
