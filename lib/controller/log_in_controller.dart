import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/UI/home_guardians/index_guardian.dart';
import 'package:stripling_wallet/core/models/user_details.dart';
import 'package:stripling_wallet/core/network/auth.dart';
import 'package:stripling_wallet/core/network/error_handler.dart';

import '../core/database/user_db_helper.dart';

class LoginController extends GetxController {

  /// A [TextEditingController] to control the input text for the user's email
  final emailController  = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's password
  final passwordController = TextEditingController();

  RxBool showSpinner = false.obs;

  Future<void> signIn() async {
    log(emailController.text);
    log(passwordController.text);
    Map<String, dynamic> body = {
      'username': emailController.text.trim().toLowerCase(),
      'password': passwordController.text
    };
    showSpinner.value = true;
    await AuthServices().login(body).then((value) async {
      if(value !=  null){
        await AuthServices().getUsersDetails(emailController.text.trim().toLowerCase()).then((value){
          _storeDetails(value);
          showSpinner.value = false;
        }).catchError((e){
          showSpinner.value = false;
          ErrorHandler().handleError(e);
        });
      }
      //print(value);
    }).catchError((e){
      showSpinner.value = false;
      ErrorHandler().handleError(e);
      //log(e);
    });
  }

  void _storeDetails(UserDetails user) async {
    var db = DatabaseHelper();
     db.initDb();
     await db.saveUser(user);
    showSpinner.value = false;
    Get.toNamed(IndexGuardian.id);
  }

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

}