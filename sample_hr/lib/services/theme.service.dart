import 'package:flutter/material.dart';

class ThemeService{

  static var customStyle =  TextStyle(
            color: Colors.blue
          );

  static getMainTheme(){
    return ThemeData(
        
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 15.0
          ),
        ),
        primarySwatch: Colors.red,
      );
  }

}