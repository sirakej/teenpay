import 'dart:developer';
import 'package:get/get.dart';
import 'package:stripling_wallet/core/models/user_details.dart';
import '../core/database/user_db_helper.dart';
import '../core/network/auth.dart';
import '../core/network/error_handler.dart';
import 'home_controller.dart';

class WalletController extends GetxController{
  final user = Get.find<HomeGuardianController>().user;

  final dynamicUserDetails = Get.find<HomeGuardianController>().dynamicDetails;
  /// This variable holds the value for user loaded status
  RxBool userLoaded = false.obs;

  RxBool see = Get.find<HomeGuardianController>().see;

}