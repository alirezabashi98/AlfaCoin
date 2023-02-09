import 'package:alfa_coin/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Model/cryptocurrency_model.dart';
import '../../../utility/abbreviate_number.dart';

class ItemCryptoTablet extends StatelessWidget {
  const ItemCryptoTablet({Key? key, required this.crypto}) : super(key: key);
  final CryptocurrencyModel crypto;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyText1!;
    var minFontSize = 7.0;
    var maxFontSize = 15.0;
    var maxFontSizeSubtitle = 13.0;
    var minFontSizePrice = 10.0;
    var maxFontSizePrice = 18.0;
    var maxFontSizeRank = 16.0;

    return ListTile(
      title: AutoSizeText(
        maxLines: 1,
        minFontSize: minFontSize,
        maxFontSize: maxFontSize,
        crypto.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsApp.green,
        ),
      ),
      subtitle: AutoSizeText(
        maxLines: 1,
        minFontSize: minFontSize,
        maxFontSize: maxFontSizeSubtitle,
        crypto.symbol,
        style: const TextStyle(
          color: ColorsApp.grey,
          fontSize: 12,
        ),
      ),
      leading: SizedBox(
        width: 17.w,
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 8.w,
                child: AutoSizeText(
                  maxLines: 1,
                  minFontSize: minFontSize,
                  maxFontSize: maxFontSizeRank,
                  crypto.rank < 100
                      ? crypto.rank < 10
                          ? "00${crypto.rank}"
                          : "0${crypto.rank}"
                      : crypto.rank.toString(),
                  style: style.copyWith(fontSize: 16,fontWeight: FontWeight.bold)
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 9.w,
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
        width: 60.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            SizedBox(
              width: 65,
              child: AutoSizeText(
                maxLines: 1,
                minFontSize: minFontSize,
                maxFontSize: maxFontSize,
                "\$${abbreviateNumber(crypto.marketCapUsd)}",
                style: style.copyWith(fontSize: 14),
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 65,
              child: AutoSizeText(
                maxLines: 1,
                minFontSize: minFontSize,
                maxFontSize: maxFontSize,
                abbreviateNumber(crypto.supply),
                style: style.copyWith(fontSize: 14),
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 22.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AutoSizeText(
                    maxLines: 1,
                    minFontSize: minFontSizePrice,
                    maxFontSize: maxFontSizePrice,
                    "\$${crypto.priceUsd.toStringAsFixed(2)}",
                    style: style.copyWith(fontSize: 17),
                  ),
                  AutoSizeText(
                    "${crypto.changePercent24Hr.toStringAsFixed(2)}%",
                    maxLines: 1,
                    minFontSize: minFontSize,
                    maxFontSize: maxFontSize,
                    style: TextStyle(
                      color: _getColorChangePercent(crypto.changePercent24Hr),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 1.w),
            SizedBox(
              width: 28,
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
          color: ColorsApp.red,
        )
      : const Icon(
          Icons.trending_up,
          color: ColorsApp.green,
        );

  Color _getColorChangePercent(double percentChange) =>
      percentChange <= 0 ? ColorsApp.red : ColorsApp.green;
}
