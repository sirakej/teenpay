import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyConstants {
  final String firstName = '';
  final String lastName = '';


  static BorderRadius primaryBorderRadius =
  const BorderRadius.all(Radius.circular(4.0));

  static BorderRadius cardBorderRadius =
  const BorderRadius.all(Radius.circular(10.0));

  static InputDecoration formInputDecoration =  Get.isDarkMode?const InputDecoration(
    fillColor: Color(0xFF211F32),
    filled: true,
    border:OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(color: Colors.transparent)
    ),
    focusedBorder:OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(color: Colors.transparent)
    ),
  ):const InputDecoration(
    fillColor: Color(0xFFF3F5FC),
    filled: true,
    border:OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(color: Colors.transparent)
    ),
    focusedBorder:OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(color: Colors.transparent)
    ),
  );


  static InputDecoration kTextBigFieldDecoration =InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: const Color(0xFF151920).withOpacity(0.32 ), width: 1.0, style: BorderStyle.solid),
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color:const Color(0xFF151920).withOpacity(0.32 ), width: 1.0, style: BorderStyle.solid),
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
    ),
  );


}

class AppColors {
  AppColors._(); //this is to prevent anyone from instantiating this object

  // Dark Theme colors
  static const Color darkBackground = Color(0xFF15141F);
  static const Color darkTextWhite = Color(0xFFFFFFFF);
  //static const Color darkTextBlue = Color(0xFF3068A4);
  //static const Color darkButtonBlue = Color(0xFF3068A4);

  static const Color darkBottomSheet = Color(0xFF211F32);
  static Color darkIndexUnselected = const Color(0xFFDFE3EA).withOpacity(0.8);

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightTextBlack = Color(0xFF161616);
  static const Color lightBottomSheet = Color(0xFFFFFFFF);
}