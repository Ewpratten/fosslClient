import 'package:flutter/material.dart';
import 'package:fosslclient/devrant/Rant.dart';

import '../devrant/DevRant.dart';

class RantWidget extends StatefulWidget {
  Rant rant;

  RantWidget(Rant rant) {
    this.rant = rant;
  }

  @override
  State<StatefulWidget> createState() {
    return RantWidgetState(rant);
  }
}

class RantWidgetState extends State<RantWidget> {
  Rant rant;

  bool voting = false;

  RantWidgetState(Rant rant) {
    this.rant = rant;
  }

  @override
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
                child: _buildLeft(context)),

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

  Widget _buildLeft(BuildContext context) {
    if (voting) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: <Widget>[
        //Upvote
        InkWell(
          onTap: () {
            setState(() {
              voting = true;
            });
            rant.upVote().then((sc) {
              setState(() {
                voting = false;
              });
            });
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 2.5),
              child: new Icon(
                Icons.add,
                color: rant.voteButtonsState == VoteButtonsState.DISABLED
                    ? Colors.grey
                    : Colors.white,
                size: 30.0,
              ),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: rant.voteButtonsState == VoteButtonsState.DISABLED
                      ? Colors.black54
                      : rant.voteButtonsState == VoteButtonsState.UP_VOTED
                          ? Colors.red
                          : Colors.blue),
              padding: const EdgeInsets.all(2),
            ),
          ),
        ),
        // Score
        Text(
          rant.score.toString(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        // Downvote
        InkWell(
          onTap: () {
            setState(() {
              voting = true;
            });
            rant.downVote().then((sc) {
              setState(() {
                voting = false;
              });
            });
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 2.5),
              child: new Icon(
                Icons.remove,
                color: rant.voteButtonsState == VoteButtonsState.DISABLED
                    ? Colors.grey
                    : Colors.white,
                size: 30.0,
              ),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: rant.voteButtonsState == VoteButtonsState.DISABLED
                      ? Colors.black54
                      : rant.voteButtonsState == VoteButtonsState.DOWN_VOTED
                          ? Colors.red
                          : Colors.blue),
              padding: const EdgeInsets.all(2),
            ),
          ),
        ),
      ],
    );
  }
}
