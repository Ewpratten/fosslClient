class APIException implements Exception {
  String get errMsg => "APIException";

  @override
  String toString() {
    return errMsg;
  }
}

class APINotInitializedException implements APIException {
  @override
  String get errMsg =>
      "API NOT INITALIZED. The DevRant object's init() method has not yet been called.";
}

class APINotAuthenticatedException implements APIException {
  @override
  // TODO: implement errMsg
  String get errMsg =>
      "API IS NOT AUTHENTICATED. The login() function must be invoked successfully before this action can be performed.";
}

class APIUnknownException implements APIException {
  @override
  // TODO: implement errMsg
  String get errMsg => _em;

  String _em = "An Unknown Exception occured.";

  APIUnknownException();

  APIUnknownException.withMessage(String em) {
    _em = em;
  }
}

class APIInternalIllegalStateException implements APIException {
  @override
  String get errMsg =>
      "The API wrapper ended up in an illegal internal state. Blame @xzvf and please call unFuckAPI() to reinitalize the API.";
}

class APIAlreadyAuthenticatedException implements APIException {
  @override
  // TODO: implement errMsg
  String get errMsg => "The API is already logged in. Please call logout() before calling login()";
}

class APIMethodNotImplementedException implements APIException {
  @override
  // TODO: implement errMsg
  String get errMsg => "This API method is not implemented yet. Complain to @xzvf.";

}

class APIRequestFailedException implements APIException {
  @override
  // TODO: implement errMsg
  String get errMsg => "API request failed.";
}

class APIAuthenticationFailedException implements APIException {
  @override
  // TODO: implement errMsg
  String get errMsg => "The api failed to authenticate. Invalid username or password?";
}

class APIInvalidParametersException implements APIException {
  @override
  // TODO: implement errMsg
  String get errMsg => "The parameters passed to this function are invalid.";

}