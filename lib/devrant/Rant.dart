import 'DevRant.dart';

class Rant {
  String body;
  String username;
  int score;
  int id;
  int voteState;
  dynamic tags;

  DevRant _api;

  Rant();

  Rant.fromJSON(dynamic raw) {
    body = raw["text"];
    username = raw["user_username"];
    score = raw["score"];
    id = raw["id"];
    tags = raw["tags"];
    voteState = raw["vote_state"];
    _api = DevRant();
  }

  void vote(int type) {
    // For now, just print that the user voted
    print("User voted (" + type.toString() + ") on rant:" + id.toString());
  }

  VoteButtonsState get voteButtons {
    //if(_api.loggedIn && _api.)
  }

  String getTags() {
    String output = "";
    for (String tag in tags) {
      output += tag + ", ";
    }
    output = output.substring(0, output.length - 2);
    return output;
  }
}

enum VoteButtonsState {
  DISABLED,
  NOT_VOTED,
  UP_VOTED,
  DOWN_VOTED,
}