import 'package:alfa_coin/ui/responsive_layout.dart';
import 'package:alfa_coin/ui/screen/mobile/home_mobile_screen.dart';
import 'package:alfa_coin/ui/screen/tablet/home_tablet_screen.dart';
import 'package:alfa_coin/ui/widget/app_bar_home.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
          appBar: appBarHome(context),
          body: SafeArea(
            child: ResponsiveLayout(
              MobileScaffold: const HomeTabletScreen(),
              TabletScaffold: const HomeTabletScreen(),
              DesktopScaffold: const HomeTabletScreen(),
            ),
          ),
        ),
      );
  }
}
