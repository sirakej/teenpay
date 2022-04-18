import 'package:stripling_wallet/core/models/createUser.dart';

import 'endpoint.dart';
import 'error_handler.dart';
import 'network_util.dart';

class AuthServices{
  /// Instantiating the class [ErrorHandler]
  var errorHandler = ErrorHandler();

  /// Instantiating the class [NetworkHelper]
  var netUtil = NetworkUtil();

  Future<CreateUser> createUser(Map<String, dynamic> body) async{
    return netUtil.post(SIGN_UP,body: body, headers: {})
        .then((value) {
          return CreateUser.fromJson(value);
    }).catchError((e) {
     // print(e);
      //errorHandler.handleError(e.toString());
    });
  }

  Future<dynamic> login(Map<String, dynamic> body) async{
    return netUtil.post(LOGIN,body: body, headers: {})
        .then((value) {
      return value;
    }).catchError((e){
     errorHandler.handleError(e.toString());
    });
  }
}