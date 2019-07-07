import 'DevRant.dart';

class Rant {
  String body;
  String username;
  int userId;
  int score;
  int id;
  int voteState;
  dynamic tags;

  DevRant _api;

  Rant();

  Rant.fromJSON(dynamic raw) {
    body = raw["text"];
    username = raw["user_username"];
    userId = raw["user_id"];
    score = raw["score"];
    id = raw["id"];
    tags = raw["tags"];
    voteState = raw["vote_state"];
    _api = DevRant();
  }

  //returns what state the up and downvote-buttons should be in.
  VoteButtonsState get voteButtonsState {
    return (_api.loggedIn && _api.userId != null && userId == _api.userId) ||
            !_api.loggedIn
        ? VoteButtonsState.DISABLED
        : voteState == 1
            ? VoteButtonsState.UP_VOTED
            : voteState == -1
                ? VoteButtonsState.DOWN_VOTED
                : VoteButtonsState.NOT_VOTED;
  }

  // Process upvote. up and downvote are seperate functions because they do different things based on the vote state.
  Future<int> upVote() async {
    print("upvote called");
    switch (voteButtonsState) {
      case VoteButtonsState.DISABLED:
        return score;
      case VoteButtonsState.UP_VOTED:
        score = await _api.voteRant(id, 0);
        voteState = 0;
        return score;
      case VoteButtonsState.DOWN_VOTED:
        score = await _api.voteRant(id, 1);
        voteState = 1;
        return score;
      default:
        voteState = 1;
        score++;
        score = await _api.voteRant(id, 1);
        return score;
    }
  }

  // Process downvote. up and downvote are seperate functions because they do different things based on the vote state.
  Future<int> downVote() async {
      switch (voteButtonsState) {
        case VoteButtonsState.DISABLED:
          return score;
        case VoteButtonsState.DOWN_VOTED:
          score = await _api.voteRant(id, 0);
          voteState = 0;
          return score;
        case VoteButtonsState.UP_VOTED:
          score = await _api.voteRant(id, -1);
          voteState = -1;
          return score;
        default:
          score = await _api.voteRant(id, -1);
          voteState = -1;
          return score;
      }
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
