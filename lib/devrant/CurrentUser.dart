class CurrentUser {
  String name = "ewpratten";
  int id = 0;
  int score = 999;

  CurrentUser getInstance() {
    if (_user_instance == null) {
      _user_instance = new CurrentUser();
    }

    return _user_instance;
  }

  String getScoreString() {
    return score.toString()+"++";
  }
}

CurrentUser _user_instance = null;
