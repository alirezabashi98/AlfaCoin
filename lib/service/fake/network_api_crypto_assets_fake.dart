import 'package:alfa_coin/Model/cryptocurrency_model.dart';
import 'package:alfa_coin/service/network_api.dart';

class NetworkApiCryptoAssetsFake extends NetworkApi{

  @override
  Future<List<CryptocurrencyModel>> getAllCrypto() async {

    return <CryptocurrencyModel>[
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 1, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
      CryptocurrencyModel("1", 1, "symbol", "name", 222.2, 222.2, 222.2, 222.2, 222.2, 222.2, 222.2),
    ];
  }

}