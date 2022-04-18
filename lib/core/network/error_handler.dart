import 'dart:async';
import 'dart:developer';
import 'dart:io';

class ErrorHandler {
  /// Function to handle error messages from the server
  void handleError(dynamic e) {
    log(e.toString());
    if (e is HandshakeException || e.toString().contains('HandshakeException')) {
      throw ('Error occurred, please try again');
    }
    else if(e is SocketException || e.toString().contains('SocketException')){
      throw ('No internet connection');
    }
    if(e is TimeoutException || e.toString().contains('TimeoutException')){
      throw ('Request timeout, try again');
    }
    if(e is FormatException || e.toString().contains('FormatException')){
      throw ('Error occurred, please try again');
      ('Error occurred, please try again');
    }
    throw (e);
  }
  void handleAuthError() {
    throw 'You\'re unauthorized, log out and login back to continue';
  }

}