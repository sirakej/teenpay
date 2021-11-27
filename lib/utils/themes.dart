import 'package:flutter/material.dart';
import 'package:stripling_wallet/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyThemes {
  static ThemeData lightTheme = ThemeData(
      // primarySwatch: Colors.blue,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: MyColors.scaffoldBackgroundColor,
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 48.0),
        headline2: TextStyle(fontSize: 36.0),
        headline3: TextStyle(fontSize: 24.0),
        headline4: TextStyle(fontSize: 18.0),
        bodyText1: TextStyle(fontSize: 18.0),
        subtitle1: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        subtitle2: TextStyle(
          fontSize: 12.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(selectedItemColor: MyColors.primaryColor)
      // bottomNavigationBarTheme: BottomNavigationBarTheme(data: null,
      // child: ,)
      // buttonTheme: ButtonThemeData(buttonColor: ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ButtonStyle(
      //     backgroundColor: MaterialStateProperty.all(const Color(0xFF335491)),
      //   ),
      // ),
      );

  static ThemeData darkTheme = ThemeData(
    // primarySwatch: Colors.blue,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: MyColors.scaffoldBackgroundColor,
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 48.0),
      headline2: TextStyle(fontSize: 36.0),
      headline3: TextStyle(fontSize: 24.0),
      headline4: TextStyle(fontSize: 18.0),
      bodyText1: TextStyle(fontSize: 18.0),
      subtitle1: TextStyle(fontSize: 14.0),
      subtitle2: TextStyle(fontSize: 12.0),
    ),
    // buttonTheme: ButtonThemeData(buttonColor: ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all(const Color(0xFF335491)),
    //   ),
    // ),
  );
}
