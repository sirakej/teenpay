import 'dart:developer';
import 'package:get/get.dart';
import 'package:stripling_wallet/core/models/user_details.dart';
import '../core/database/user_db_helper.dart';
import '../core/network/auth.dart';
import '../core/network/error_handler.dart';

class HomeGuardianController extends GetxController{
  /// This variable is holding the details of the user
  final user = UserDetails().obs;

  final dynamicDetails = UserDetails().obs;

  // This variable is holding the user Email
  RxString userEmail = "".obs;

  /// This variable holds the value for user loaded status
  RxBool userLoaded = false.obs;

  RxBool see = false.obs;

  /// Setting the current user logged in to [user]
  void getCurrentUser() async {
    await DatabaseHelper().getUser().then((value) {
      user.value= value;
      getUserDetails(user.value.email.toString());
      userLoaded.value = true;
    }).catchError((e) {
      log(e);
    });
  }

  void getUserDetails(String email) async {
    await AuthServices().getUsersDetails(email).then((value){
      dynamicDetails.value = value;
    }).catchError((e){
      ErrorHandler().handleError(e);
    });
  }

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }
}