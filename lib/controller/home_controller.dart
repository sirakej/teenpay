import 'dart:developer';
import 'package:get/get.dart';
import 'package:stripling_wallet/core/models/user_details.dart';
import '../core/database/user_db_helper.dart';

class HomeGuardianController extends GetxController{
  /// This variable is holding the details of the user
  final user = UserDetails().obs;

  /// This variable holds the value for user loaded status
  RxBool userLoaded = false.obs;

  /// Setting the current user logged in to [user]
  void getCurrentUser() async {
    await DatabaseHelper().getUser().then((value) {
      print("this is real");
      user.value= value;
      userLoaded.value = true;
    }).catchError((e) {
      log(e);
    });
  }

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }
}