import 'dart:ui';

import 'package:alfa_coin/di/init_service_locator.dart';
import 'package:alfa_coin/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  initServiceLocator();
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        // etc.
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      home: const Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
