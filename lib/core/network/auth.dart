import 'dart:developer';

import 'package:stripling_wallet/core/models/user_details.dart';
import 'endpoint.dart';
import 'error_handler.dart';
import 'network_util.dart';

class AuthServices{
  /// Instantiating the class [ErrorHandler]
  var errorHandler = ErrorHandler();

  /// Instantiating the class [NetworkHelper]
  var netUtil = NetworkUtil();

  Future<dynamic> createUser(Map<String, dynamic> body) async{
    return netUtil.post(SIGN_UP,body: body, headers: {})
        .then((value) {
          return value;
    }).catchError((e) {
     print(e);
      errorHandler.handleError(e.toString());
    });
  }

  Future<dynamic> login(Map<String, dynamic> body) async{
    return netUtil.post(LOGIN,body: body, headers: {})
        .then((value) {
      return value;
    }).catchError((e){
     errorHandler.handleError(e);
    });
  }

  Future<UserDetails> getUsersDetails(String body) async{
    String addParameters = TEST+"?email=$body";
    return netUtil.get(addParameters,headers: {})
        .then((value) {
          //log(UserDetails.fromJson(value).toString());
      return UserDetails.fromJson(value);
    }).catchError((e){
      errorHandler.handleError(e);
    });
  }
}