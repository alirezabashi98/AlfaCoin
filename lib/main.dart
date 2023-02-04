import 'dart:ui';

import 'package:alfa_coin/constants/constants.dart';
import 'package:alfa_coin/di/init_service_locator.dart';
import 'package:alfa_coin/ui/screen/desktop/home_desktop_screen.dart';
import 'package:alfa_coin/ui/screen/mobile/home_mobile_screen.dart';
import 'package:alfa_coin/ui/screen/tablet/home_tablet_screen.dart';
import 'package:alfa_coin/ui/screen/watch/home_watch_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

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
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        home: Scaffold(
          backgroundColor: ColorsApp.backgroundScreenDark,
          body: ScreenTypeLayout(
            // ignore: prefer_const_constructors
            breakpoints: ScreenBreakpoints(
              tablet: 550,
              desktop: 688,
              watch: 320,
            ),
            mobile: OrientationLayoutBuilder(
                portrait: (context) => const HomeMobileScreen(),
                landscape: (context) => const HomeTabletScreen()),
            tablet: const HomeTabletScreen(),
            desktop: const HomeDesktopScreen(),
            watch: const HomeWatchScreen(),
          ),
        ),
      ),
    );
  }
}
