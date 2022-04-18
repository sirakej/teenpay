import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/core/network/auth.dart';

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
    showSpinner = true.obs;
    await AuthServices().login(body).then((value) async {
      showSpinner = false.obs;
      //print(value);
    }).catchError((e){
      showSpinner = false.obs;

    });
  }

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

}