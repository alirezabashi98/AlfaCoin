import 'package:alfa_coin/Model/cryptocurrency_model.dart';
import 'package:alfa_coin/constants/constants.dart';
import 'package:alfa_coin/constants/theme_config.dart';
import 'package:alfa_coin/ui/responsive_layout.dart';
import 'package:alfa_coin/ui/screen/detail_screen.dart';
import 'package:alfa_coin/utility/open_web.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailePage extends StatelessWidget {
  final CryptocurrencyModel crypto;

  const DetailePage({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: _getAppBar(context, crypto),
        body: SafeArea(
          child: LineChartDesktopScreen(crypto: crypto),
        ),
      ),
    );
  }

  _getAppBar(BuildContext context, CryptocurrencyModel crypto) {
    var themeDark =
        Theme.of(context).appBarTheme.iconTheme!.color == ColorsApp.grey;
    var style = Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 10);

    return AppBar(
      title: Row(
        children: [
          SizedBox(
            width: 30.0,
            height: 30,
            child: CachedNetworkImage(
              imageUrl:
                  "https://assets.coincap.io/assets/icons/${(crypto.symbol.toLowerCase() == 'ustc') ? 'ust' : crypto.symbol.toLowerCase()}@2x.png",
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 8),
          Text('${crypto.name} (${crypto.symbol})',
              style: style.copyWith(fontSize: 16)),
        ],
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
      automaticallyImplyLeading: true,
      actions: [
        GestureDetector(
          onTap: () => openWebInDesktop(crypto.symbol),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SvgPicture.asset(
              width: 32,
              'assets/svg/chart.svg',
              semanticsLabel: 'Technical Chart',
              color: style.color,
            ),
          ),
        ),
        const SizedBox(width: 6),
        ThemeSwitcher.withTheme(
          builder: (context, switcher, theme) {
            // var iconLight =  Brightness.light ? false : lightTheme,
            return IconButton(
              onPressed: () => switcher.changeTheme(
                theme: theme.brightness == Brightness.light
                    ? darkTheme
                    : lightTheme,
              ),
              icon:
                  Icon(themeDark ? Icons.sunny : Icons.brightness_3, size: 25),
            );
          },
        ),
      ],
    );
  }
}
