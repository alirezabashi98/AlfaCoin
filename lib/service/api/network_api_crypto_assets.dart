import 'package:alfa_coin/Model/cryptocurrency_model.dart';
import 'package:alfa_coin/di/init_service_locator.dart';
import 'package:dio/dio.dart';

abstract class INetworkApiCryptoAssets {
  Future<List<CryptocurrencyModel>> getAllCrypto();
}

class NetworkApiCryptoAssets extends INetworkApiCryptoAssets {
  final Dio _dio = locator.get();

  @override
  Future<List<CryptocurrencyModel>> getAllCrypto() async {
    try {
      final response = await _dio.get('assets');

      List<CryptocurrencyModel> cryptoList = response.data['data']
          .map<CryptocurrencyModel>(
            (jsonMapObject) => CryptocurrencyModel.fromMapJson(jsonMapObject),
          )
          .toList();
      return cryptoList;
    } catch (ex) {
      // ignore: avoid_print
      print("error get data crypro assets : ${ex}");
    }

    return [];
  }
}
