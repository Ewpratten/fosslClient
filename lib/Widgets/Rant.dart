import 'package:flutter/material.dart';
import 'package:fosslclient/devrant/Rant.dart';

class RantWidget {
  Rant rant;

  RantWidget(Rant rant) {
    this.rant = rant;
  }

  Container build(double c_width) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  InkWell(
                    child: Text(
                      "++",
                      style: TextStyle(fontSize: 25),
                    ),
                    highlightColor: Color(0x1f1f1f1f),

                    onTap: () {
                      rant.vote(1);
                    },
                  ),
                  Text(rant.score.toString()),
                  InkWell(
                    child: Text(
                      "--",
                      style: TextStyle(fontSize: 28),
                    ),
                    highlightColor: Color(0x1f1f1f1f),

                    onTap: () {
                      rant.vote(-1);
                    },
                  ),
                ],
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: c_width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        rant.username,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(rant.body),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          rant.getTags(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onDoubleTap: () {
                  rant.vote(1);
                },
                onTap: () {
                  // Open the rant
                },
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
