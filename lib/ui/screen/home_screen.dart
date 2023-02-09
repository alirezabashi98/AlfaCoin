import 'package:alfa_coin/ui/screen/tablet/home_tablet_screen.dart';
import 'package:alfa_coin/ui/screen/watch/home_watch_screen.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../widget/app_bar_home.dart';
import 'desktop/home_desktop_screen.dart';
import 'mobile/home_mobile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: appBarHome(),
        body: SafeArea(
          child: ScreenTypeLayout(
            // ignore: prefer_const_constructors
            breakpoints:
                const ScreenBreakpoints(tablet: 550, desktop: 688, watch: 250),
            mobile: OrientationLayoutBuilder(
              portrait: (context) => const HomeMobileScreen(),
              landscape: (context) => const HomeTabletScreen(),
            ),
            tablet: OrientationLayoutBuilder(
              portrait: (context) => const HomeTabletScreen(),
              landscape: (context) => const HomeDesktopScreen(),
            ),
            desktop: const HomeDesktopScreen(),
            watch: const HomeWatchScreen(),
          ),
        ),
      ),
    );
  }
}
