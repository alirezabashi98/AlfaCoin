import 'package:alfa_coin/constants/constants.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.blue,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    centerTitle: false,
    titleTextStyle: TextStyle(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  scaffoldBackgroundColor: ColorsApp.backgroundScreenLight,
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.black),
  ),
);
ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: ColorsApp.backgroundScreenDark,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorsApp.backgroundScreenDark,
    centerTitle: false,
    titleTextStyle: TextStyle(color: Colors.white),
    iconTheme: IconThemeData(color: ColorsApp.grey),
  ),
  scaffoldBackgroundColor: ColorsApp.backgroundScreenDark,
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: ColorsApp.grey),
  ),
);
