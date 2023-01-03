import 'dart:ui';

import 'package:alfa_coin/di/initServiceLocator.dart';
import 'package:alfa_coin/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'Model/cryptocurrency_model.dart';

void main(){
  initServiceLocator();
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      home: const Scaffold(
        body:  SplashScreen(),
      ),
    );
  }
}
