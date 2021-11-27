import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'colors.dart';

class MyConstants {
  static BorderRadius primaryBorderRadius =
      const BorderRadius.all(Radius.circular(4.0));

  static BorderRadius cardBorderRadius =
      const BorderRadius.all(Radius.circular(10.0));

  static InputDecoration formInputDecoration = InputDecoration(
    focusColor: MyColors.primaryColor,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: MyColors.primaryColor, width: 1),
    ),
    border: const OutlineInputBorder(),
  );
}
