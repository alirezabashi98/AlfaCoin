import 'package:alfa_coin/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Model/cryptocurrency_model.dart';

class ItemCrypto extends StatelessWidget {
  const ItemCrypto({Key? key, required this.crypto}) : super(key: key);
  final CryptocurrencyModel crypto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        crypto.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsApp.green,
        ),
      ),
      subtitle: Text(
        crypto.symbol,
        style: const TextStyle(
          color: ColorsApp.grey,
          fontSize: 12,
        ),
      ),
      leading: SizedBox(
        width: 90.0,
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 40.0,
                child: Text(
                  crypto.rank < 100
                      ? crypto.rank < 10
                          ? "00${crypto.rank}"
                          : "0${crypto.rank}"
                      : crypto.rank.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsApp.grey,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 40.0,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://coinicons-api.vercel.app/api/icon/${crypto.symbol.toLowerCase()}",
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ],
          ),
        ),
      ),
      trailing: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  crypto.priceUsd.toStringAsFixed(2),
                  style: const TextStyle(color: ColorsApp.grey, fontSize: 17),
                ),
                Text(
                  "${crypto.changePercent24Hr.toStringAsFixed(2)}%",
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
