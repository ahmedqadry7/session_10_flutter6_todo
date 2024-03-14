import 'package:flutter/material.dart';
import 'package:session_10_flutter6_todo/my_theme_data.dart';

class MyProvider extends ChangeNotifier{
  String languageCode = "en";
  Color theme = MyTheme.lightColor;

  changeLanguage(String code){
    languageCode = code;
    notifyListeners();
  }

  changeTheme(Color color){
    theme = color;
    notifyListeners();
  }
}