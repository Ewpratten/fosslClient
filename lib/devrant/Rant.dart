class Rant {
  String body;
  String username;
  int score;
  int id;
  dynamic tags;

  Rant(dynamic raw) {
    body = raw["body"];
    username = raw["user_username"];
    score = raw["score"];
    id = raw["rant_id"];
    tags = raw["tags"];
  }

  void vote(int type) {
    // For now, just print that the user voted
    print("User voted (" + type.toString() + ") on rant:" + id.toString());
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
