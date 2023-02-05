import 'package:alfa_coin/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Model/cryptocurrency_model.dart';

class ItemCryptoMobile extends StatelessWidget {
  const ItemCryptoMobile({Key? key, required this.crypto}) : super(key: key);
  final CryptocurrencyModel crypto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(
        crypto.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsApp.green,
        ),
        maxLines: 1,
      ),
      subtitle: AutoSizeText(
        crypto.symbol,
        maxLines: 1,
        style: const TextStyle(
          color: ColorsApp.grey,
          fontSize: 12,
        ),
      ),
      leading: SizedBox(
        width: 17.0.w,
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 8.w,
                child: AutoSizeText(
                  crypto.rank < 100
                      ? crypto.rank < 10
                          ? "00${crypto.rank}"
                          : "0${crypto.rank}"
                      : crypto.rank.toString(),
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorsApp.grey,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 8.w,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://assets.coincap.io/assets/icons/${(crypto.symbol.toLowerCase() == 'ustc') ? 'ust' : crypto.symbol.toLowerCase()}@2x.png",
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ],
          ),
        ),
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
                  crypto.priceUsd.toStringAsFixed(2),
                  maxLines: 1,
                  style: const TextStyle(color: ColorsApp.grey, fontSize: 17),
                ),
                AutoSizeText(
                  "${crypto.changePercent24Hr.toStringAsFixed(2)}%",
                  maxLines: 1,
                  style: TextStyle(
                    color: _getColorChangePercent(crypto.changePercent24Hr),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 50,
              child: Center(
                child: _getIconChangePercent(crypto.changePercent24Hr),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getIconChangePercent(double percentChange) => percentChange <= 0
      ? const Icon(
          Icons.trending_down,
          size: 24,
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
