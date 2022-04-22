import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripling_wallet/UI/welcome/registration/guardian_registration/guardian_sign_up/otp.dart';
import 'package:stripling_wallet/core/network/auth.dart';
import 'package:stripling_wallet/core/network/error_handler.dart';

class OnBoardController extends GetxController {

  /// A [GlobalKey] to hold the form state of my form widget for form validation
  final formKey = GlobalKey<FormState>();

  final formKeyTwo = GlobalKey<FormState>();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController fullNameController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController emailController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController phoneNumberController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's password
  final TextEditingController passwordController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController referralController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's email
  final TextEditingController bankVerificationNumberController = TextEditingController();

  /// A [TextEditingController] to control the input text for the user's password
  final TextEditingController dateOfBirthController = TextEditingController();

  RxBool showSpinner = false.obs;

  RxString firstName = ''.obs;

  RxString lastName = ''.obs;

  RxBool terms = false.obs;

  Future<void> signUp() async {
    fullNameSplit();
    log(firstName.value);
    log(lastName.value);
    log(emailController.text);
    log(phoneNumberController.text);
    log(passwordController.text);
    Map<String, dynamic> body = {
      'username': emailController.text.trim().toLowerCase(),
      'firstname': firstName.trim().toLowerCase(),
      'lastname':  lastName.trim().toLowerCase(),
      'gender': 'Male',
      'email': emailController.text.trim().toLowerCase(),
      "userType": 'Guardian',
      'phonenumber':phoneNumberController.text,
      'password': passwordController.text,
      'guardianId': 0
    };
    showSpinner.value = true;
    await AuthServices().createUser(body).then((value) async {
      showSpinner.value = false;
      Get.toNamed(OTP.id);
    }).catchError((e){
      showSpinner.value = false;
      ErrorHandler().handleError(e);
      //log(e);
    });
  }

  fullNameSplit(){
    if(fullNameController.text.split("\\w+").isNotEmpty){
      lastName.value = fullNameController.text.substring(fullNameController.text.lastIndexOf(" ")+1);
      firstName.value =fullNameController.text.substring(0, fullNameController.text.lastIndexOf(' '));
    }
    else{
      firstName.value = fullNameController.text;
    }
  }

  @override
  void dispose() {
    fullNameController.clear();
    firstName.value = "";
    lastName.value="";
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    super.dispose();
  }

}