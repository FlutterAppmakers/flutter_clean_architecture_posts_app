import 'package:flutter/material.dart';

final primaryColor = Color(0xff082659);
final secondaryColor = Color(0xff51eec2);

final appTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        iconColor: Colors.white
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
          iconColor: Colors.white
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        side: BorderSide(color: primaryColor),
          iconColor: Colors.white
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey.shade300,
      thickness: 0.5,
      endIndent: 16,
    ),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryColor),
        iconColor: secondaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        )));