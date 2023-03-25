import 'package:alfa_coin/ui/responsive_layout.dart';
import 'package:alfa_coin/ui/screen/home_screen.dart';
import 'package:alfa_coin/ui/widget/app_bar_home.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
          appBar: appBarHome(context),
          body: SafeArea(
            child: ResponsiveLayout(
              MobileScaffold: const HomeScreen(),
              TabletScaffold: const HomeScreen(),
              DesktopScaffold: const HomeScreen(),
            ),
          ),
        ),
      );
  }
}
