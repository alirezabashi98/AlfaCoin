import 'package:alfa_coin/Model/cryptocurrency_model.dart';
import 'package:alfa_coin/service/network_api.dart';
import 'package:dio/dio.dart';

class NetworkApiCryptoAssets extends NetworkApi {
  @override
  Future<List<CryptocurrencyModel>> getAllCrypto() async {
    try{
      var response = await Dio().get('https://api.coincap.io/v2/assets');

      List<CryptocurrencyModel> cryptoList = response.data['data']
          .map<CryptocurrencyModel>((jsonMapObject) => CryptocurrencyModel.fromMapJson(jsonMapObject))
          .toList();
      return cryptoList;

    }catch(ex){
      print(ex);
    }

    return [];

  }
}
