import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/constants.dart';

class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      background: AppColors.lightBackground,
      primary: AppColors.lightTextBlack,
      secondary: AppColors.lightBottomSheet,
    ),
  );

  static final darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
        background: AppColors.lightBackground,
        primary: AppColors.darkTextWhite,
        secondary: AppColors.darkBottomSheet,
      ));
}