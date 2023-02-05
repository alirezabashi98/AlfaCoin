import 'package:alfa_coin/constants/constants.dart';
import 'package:alfa_coin/utility/abbreviate_number.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../Model/cryptocurrency_model.dart';

class ItemCryptoDesktop extends StatelessWidget {
  const ItemCryptoDesktop({Key? key, required this.crypto}) : super(key: key);
  final CryptocurrencyModel crypto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(
        crypto.name,
        maxLines: 1,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsApp.green,
        ),
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
        width: 82.0,
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 40.0,
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
                width: 38.0,
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
        width: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            SizedBox(
              width: 70,
              child: AutoSizeText(
                "\$${abbreviateNumber(crypto.marketCapUsd)}",
                style: const TextStyle(color: ColorsApp.grey, fontSize: 14),
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 80,
              child: AutoSizeText(
                abbreviateNumber(crypto.supply),
                maxLines: 1,
                style: const TextStyle(color: ColorsApp.grey, fontSize: 14),
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "\$${abbreviateNumber(crypto.volumeUsd24Hr)}",
                    maxLines: 1,
                    style: const TextStyle(color: ColorsApp.grey, fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                  AutoSizeText(
                    "\$${abbreviateNumber(crypto.vwap24Hr)}",
                    maxLines: 1,
                    style: const TextStyle(color: ColorsApp.grey, fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AutoSizeText(
                    "\$${crypto.priceUsd.toStringAsFixed(2)}",
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
