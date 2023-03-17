import 'package:alfa_coin/constants/constants.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/theme_config.dart';

AppBar appBarHome(BuildContext context) {
  var themeDark = Theme.of(context).appBarTheme.iconTheme!.color == ColorsApp.grey;
  return AppBar(
    title: const AutoSizeText(
      'AlfaCoin',
      minFontSize: 7,
      maxFontSize: 16,
      maxLines: 1,
    ),
    actions: [
      ThemeSwitcher.withTheme(
        builder: (context, switcher, theme) {
          // var iconLight =  Brightness.light ? false : lightTheme,
          return IconButton(
            onPressed: () => switcher.changeTheme(
              theme:
                  theme.brightness == Brightness.light ? darkTheme : lightTheme,
            ),
            icon: Icon( themeDark ? Icons.sunny : Icons.brightness_3, size: 25),
          );
        },
      ),
    ],
  );
}
