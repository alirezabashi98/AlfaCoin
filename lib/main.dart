import 'dart:ui';

import 'package:alfa_coin/constants/constants.dart';
import 'package:alfa_coin/di/init_service_locator.dart';
import 'package:alfa_coin/ui/screen/home_screen.dart';
import 'package:alfa_coin/ui/widget/app_bar_home.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'constants/theme_config.dart';

void main() async {
  await initServiceLocator();
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
    final isPlatformDark =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    final initTheme = isPlatformDark ? darkTheme : lightTheme;

    return Sizer(
      builder: (context, orientation, deviceType) => ThemeProvider(
        initTheme: lightTheme,
        builder: (p0, myTheme) => MaterialApp(
          theme: myTheme,
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyCustomScrollBehavior(),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
