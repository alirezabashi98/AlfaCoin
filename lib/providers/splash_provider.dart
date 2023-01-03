import 'package:alfa_coin/service/network_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../Model/cryptocurrency_model.dart';

class SplashProvider extends ChangeNotifier{
  final NetworkApi apiAssets = GetIt.I.get<NetworkApi>();

  List<CryptocurrencyModel> cryptoList = [];

  void loadDate() async{
    cryptoList = await apiAssets.getAllCrypto();
    notifyListeners();
  }
}