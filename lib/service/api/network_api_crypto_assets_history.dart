import 'package:alfa_coin/Model/crypto_history.dart';
import 'package:alfa_coin/di/init_service_locator.dart';
import 'package:dio/dio.dart';

abstract class INetworkApiCryptoAssetsHistory {
  Future<List<CryptoHistoryModel>> getHistoryCrypto(
      String idCoin, String interval);
}

class NetworkApiCryptoAssetsHistory extends INetworkApiCryptoAssetsHistory {
  final Dio _dio = locator.get();

  @override
  Future<List<CryptoHistoryModel>> getHistoryCrypto(
      String idCoin, String interval) async {
    try {
      final response =
          await _dio.get('assets/$idCoin/history?interval=$interval');
      List<CryptoHistoryModel> cryptoHistory = response.data['data']
          .map<CryptoHistoryModel>(
            (jsonMapObject) => CryptoHistoryModel.fromMapJson(jsonMapObject),
          )
          .toList();
      return cryptoHistory;
    } catch (ex) {
      throw ex;
    }
  }
}
