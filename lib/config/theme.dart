import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_size.dart';

class AppTheme {
  static ThemeData get MyTheme {
    return ThemeData(
// Define the default brightness and colors.
        brightness: Brightness.light,
        splashColor: AppColors.primaryStatusColor,
        primaryColorBrightness: Brightness.dark,
        primaryColor: AppColors.primaryColor,

        fontFamily: 'Roboto',

        primaryIconTheme: IconThemeData(color: Colors.white),

        textTheme: TextTheme(
          headline: TextStyle(
              color: Colors.black,
              fontSize: 72.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold),
          title: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontFamily: 'Roboto'),
          display2: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontFamily: 'Roboto'),
          body1: TextStyle(
              color:Colors.black,
              fontSize: 16.0,
              fontFamily: 'Roboto'),
          button: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 16.0),
          display1: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: 20.0),
          caption: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.italic,
              fontSize: 12.0),
          subtitle: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 14.0),
        )
    );
  }
}
