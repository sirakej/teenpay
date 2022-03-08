import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'colors.dart';

class MyConstants {
  static BorderRadius primaryBorderRadius =
  const BorderRadius.all(Radius.circular(4.0));

  static BorderRadius cardBorderRadius =
  const BorderRadius.all(Radius.circular(10.0));

  static InputDecoration formInputDecoration =  InputDecoration(
    border:const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: const Color(0xFF151920).withOpacity(0.32 ),width: 1,style: BorderStyle.solid),
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedBorder:OutlineInputBorder(
      borderSide: BorderSide(
        color: const Color(0xFF151920).withOpacity(0.32 ),width: 1,style: BorderStyle.solid ),
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
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