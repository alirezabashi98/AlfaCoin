import 'package:alfa_coin/Model/cryptocurrency_model.dart';
import 'package:alfa_coin/ui/responsive_layout.dart';
import 'package:alfa_coin/ui/screen/detail_mobile_screen.dart';
import 'package:alfa_coin/ui/widget/app_bar_home.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

class DetailePage extends StatelessWidget {
  final CryptocurrencyModel crypto;

  const DetailePage({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        body: SafeArea(
          child: ResponsiveLayout(
            MobileScaffold: const Scaffold(
              backgroundColor: Colors.amber,
            ),
            TabletScaffold: const Scaffold(
              backgroundColor: Colors.blue,
            ),
            DesktopScaffold: LineChartDesktopScreen(crypto: crypto),
          ),
        ),
      ),
    );
  }
}
