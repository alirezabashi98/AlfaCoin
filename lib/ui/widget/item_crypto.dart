import 'package:alfa_coin/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../Model/cryptocurrency_model.dart';

// ignore: must_be_immutable
class ItemCrypto extends StatelessWidget {
  ItemCrypto(
      {
      // ignore: non_constant_identifier_names
      Key? key,
      // ignore: non_constant_identifier_names
      required this.Crypto})
      : super(key: key);
  // ignore: non_constant_identifier_names
  CryptocurrencyModel Crypto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            Crypto.rank.toString(),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Crypto.name,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                Crypto.symbol,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Spacer(),
          const SizedBox(width: 5),
          Text(
            Crypto.priceUsd.toString(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
            textAlign: TextAlign.end,
          ),
          const Spacer(),
          const SizedBox(width: 5),
          Text(
            Crypto.marketCapUsd.toString(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
            textAlign: TextAlign.end,
          ),
          const Spacer(),
          const SizedBox(width: 5),
          Text(
            Crypto.vwap24Hr.toString(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
            textAlign: TextAlign.end,
          ),
          const Spacer(),
          const SizedBox(width: 5),
          Text(
            Crypto.supply.toString(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
            textAlign: TextAlign.end,
          ),
          const Spacer(),
          const SizedBox(width: 5),
          Text(
            Crypto.volumeUsd24Hr.toString(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
            textAlign: TextAlign.end,
          ),
          const Spacer(),
          const SizedBox(width: 5),
          Text(
            Crypto.changePercent24Hr.toString(),
            style: const TextStyle(
              fontSize: 16,
              color: ColorsApp.green,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
