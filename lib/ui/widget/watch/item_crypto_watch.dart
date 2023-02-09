import 'package:alfa_coin/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Model/cryptocurrency_model.dart';

class ItemCryptoWatch extends StatelessWidget {
  const ItemCryptoWatch({Key? key, required this.crypto}) : super(key: key);
  final CryptocurrencyModel crypto;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyText1!;
    return ListTile(
      title: AutoSizeText(
        maxLines: 1,
        crypto.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsApp.green,
        ),
      ),
      subtitle: AutoSizeText(
        crypto.symbol,
        maxLines: 1,
        style: style.copyWith(fontSize: 12),
      ),
      trailing: SizedBox(
        width: 40.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AutoSizeText(
                  maxLines: 1,
                  crypto.priceUsd.toStringAsFixed(2),
                  style: style.copyWith(fontSize: 15),
                ),
                AutoSizeText(
                  maxLines: 1,
                  "${crypto.changePercent24Hr.toStringAsFixed(2)}%",
                  style: TextStyle(
                    color: _getColorChangePercent(crypto.changePercent24Hr),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getIconChangePercent(double percentChange) => percentChange <= 0
      ? const Icon(
          Icons.trending_down,
          color: ColorsApp.red,
        )
      : const Icon(
          Icons.trending_up,
          size: 24,
          color: ColorsApp.green,
        );

  Color _getColorChangePercent(double percentChange) =>
      percentChange <= 0 ? ColorsApp.red : ColorsApp.green;
}
