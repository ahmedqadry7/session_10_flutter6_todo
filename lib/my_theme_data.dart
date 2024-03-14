import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Colors.blue;
  static Color lightColor = Color(0xFFDFECDB);
  static Color darkColor = Color(0xFF060E1E);
  static Color greenColor = Color(0xFF61E757);
  static ThemeData lightTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 4),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: false,
      showSelectedLabels: true,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
