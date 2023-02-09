import 'package:alfa_coin/constants/constants.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: ColorsApp.backgroundScreenLight,
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.black),
  ),
);
ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: ColorsApp.backgroundScreenDark,
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: ColorsApp.grey),
  ),
);
