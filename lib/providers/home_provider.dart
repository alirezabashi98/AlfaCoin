import 'dart:convert';

import 'package:alfa_coin/service/network_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../Model/cryptocurrency_model.dart';

class HomeProvider extends ChangeNotifier {
  final NetworkApi apiAssets = GetIt.I.get<NetworkApi>();
  final WebSocketChannel channel =
      IOWebSocketChannel.connect("wss://ws.coincap.io/prices?assets=ALL");

  List<CryptocurrencyModel> cryptoList = [];

  void loadDate() async {
    cryptoList = await apiAssets.getAllCrypto();
    notifyListeners();
    reloadDate();
  }

  void reloadDate() {
    channel.stream.listen(
      (message) async {
        await Future.delayed(const Duration(seconds: 5), () {
          print("reload");
        });
        List<CryptocurrencyModel> newCryptoList = [];
        for (var item in cryptoList) {
          var date = jsonDecode(message)[item.id] ?? item.priceUsd;
          if (date != item.priceUsd) {
            var crypto = item;
            crypto.priceUsd = double.parse(date);
            newCryptoList.add(crypto);
          } else {
            newCryptoList.add(item);
          }
        }
        cryptoList.clear();
        cryptoList = newCryptoList;
        notifyListeners();
      },
    );
  }
}
