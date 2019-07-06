/* The api wrapper.
 */

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Rant.dart';
import 'APIException.dart';

// This is the API wrapper object. It is a singleton.
class DevRant {
  final String _base = "https://devrant.com/api";
  final int _app = 3;
  SharedPreferences _prefs;
  bool loggedIn = false;
  var userdata = {};

  //Has the init method been called
  bool _init = false;
  int _userId = -1;

  String _authToken;

  var _seenNews = [];

  //Singleton boilerplate
  static final DevRant _devRant = new DevRant._internal();

  factory DevRant() {
    return _devRant;
  }

  //Dummy private constructor
  DevRant._internal();

  // Real initialization here
  Future<void> init() async {
    print("init called.");
    if (_init) return;
    _prefs = await SharedPreferences.getInstance();
    userdata = {};

    _authToken = _prefs.getString("authToken");
    _userId = _prefs.getInt("userId");

    _init = true;
    print("initialized.");

    if (_authToken == null || _userId == null) {
      _userId = -1;
      return;
    }

    loggedIn = true;
    await fetchUserData();
  }

  Future<void> unFuckAPI() async {
    _init = false;
    loggedIn = false;
    _authToken = null;
    _userId = -1;
    userdata = {};
    await init();
  }

  Future<void> fetchUserData() async {
    if (!_init) throw new APINotInitializedException();
    if (!loggedIn) throw new APINotAuthenticatedException();
    if (_authToken == null) throw new APIInternalIllegalStateException();

    var res = await http.get(_base + "/users/" + _userId.toString() + "?app=3");
    if (res.statusCode != 200) throw new APIRequestFailedException();
    var content = jsonDecode(res.body);
    if (!content["success"]) throw new APIRequestFailedException();

    userdata = content["profile"];
  }

  Future<void> login(String username, String password) async {
    if (!_init) throw new APINotInitializedException();
    if (loggedIn) throw new APIAlreadyAuthenticatedException();
    var res = await http.post(_base + "/users/auth-token",
        body: {"password": password, "username": username, "app": '3'});
    if (res.statusCode != 200) {
      print("LOGIN FAILED: " + res.body);
      throw new APIAuthenticationFailed();
    }
    var data = jsonDecode(res.body);
    if (!data["success"]) throw new APIAuthenticationFailed();
    loggedIn = true;
    _authToken = data["auth_token"]["key"];
    _userId = data["auth_token"]["user_id"];
    
    await _prefs.setString("authToken", _authToken);
    await _prefs.setInt("userId", _userId);

    await fetchUserData();
  }

  void logout() {
    if (!_init) throw new APINotInitializedException();
    if (!loggedIn) throw new APINotAuthenticatedException();
    if (_authToken == null) throw new APIInternalIllegalStateException();

    _authToken = null;
    loggedIn = false;
    userdata = null;
    _userId = -1;
  }

  //TODO: implement method
  Future<void> voteComment() async {
    throw new APIMethodNotImplementedException();
  }

  //TODO: implement method
  Future<void> voteRant() async {
    throw new APIMethodNotImplementedException();
  }

  //TODO: implement method
  Future<void> postComment({String comment, int rant}) async {
    throw new APIMethodNotImplementedException();
  }

  //TODO: implement method
  Future<void> postRant({String body, String tags}) async {
    throw new APIMethodNotImplementedException();
  }

  Future<dynamic> getRantFeed(
      {bool hideReposts,
      int skip,
      SortBy sortBy,
      PostRange postRange,
      List<FilterOptions> filter}) async {
    //if (!_init) throw new APINotInitializedException();
    if(!_init) init();

    var params = new Map<String, dynamic>();
    params["hide_reposts"] = hideReposts ? 1 : 0;
    params["skip"] = skip ?? 0;
    switch (sortBy) {
      case SortBy.ALGO:
        params["sort"] = "algo";
        break;
      case SortBy.TOP:
        params["sort"] = "new";
        params["range"] = postRange == PostRange.DAY
            ? "day"
            : postRange == PostRange.WEEK
                ? "week"
                : postRange == PostRange.MONTH ? "month" : "all";
        break;
      case SortBy.NEW:
      default:
        params["sort"] = "new";
    }

    if (filter != null) {
      var _fw = [];
      filter.forEach((FilterOptions f) => _fw.add(f.index));
      String _filter = _fw.join(',');
      params["filters"] = _filter;
    }

    var res = await http.get(_getUrl("/devrant/rants", params));
    if (res.statusCode != 200) throw new APIRequestFailedException();
    var content = jsonDecode(res.body);
    if (!content["success"]) throw new APIRequestFailedException();
    print(content["rants"]);
    return content["rants"];
  }

  //TODO: implement method
  Future<dynamic> getRant(int id) async {
    throw new APIMethodNotImplementedException();
  }

  //TODO: implement method
  Future<dynamic> getComment(int id) async {
    throw new APIMethodNotImplementedException();
  }

  //TODO: implement method
  Future<dynamic> fetchNotifications() async {
    throw new APIMethodNotImplementedException();
  }

  //Helper function to create a get request string, the app parameter is included by default
  String _getUrl(String endpoint, Map<String, dynamic> params) {
    String url = _base + endpoint + '?app=' + _app.toString();
    params.forEach((String key, dynamic value) =>
        url += '&' + key + '=' + Uri.encodeQueryComponent(value.toString()));
    return url;
  }
}

enum SortBy { NEW, TOP, ALGO }

enum PostRange { DAY, WEEK, MONTH, ALL }

//These will be shown in the feed (i.e only passing RANTS, will only show rants)
// DO NOT CHANGE THE ORDER
enum FilterOptions {
  _,
  RANTS,
  JOKES,
  QUESTIONS,
  COLLABS,
  DEVRANT,
  RANDOM,
  UNDEFINED
}
