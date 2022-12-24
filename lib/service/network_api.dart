import 'package:alfa_coin/Model/cryptocurrency_model.dart';

abstract class NetworkApi {
  Future<List<CryptocurrencyModel>> getAllCrypto();
}
