import 'package:alfa_coin/providers/home_provider.dart';
import 'package:alfa_coin/service/api/network_api_crypto_assets.dart';
import 'package:alfa_coin/service/api/network_api_crypto_assets_history.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> initServiceLocator() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://api.coincap.io/v2/',
      ),
    ),
  );
  locator.registerSingleton<INetworkApiCryptoAssets>(NetworkApiCryptoAssets());
  locator.registerSingleton<INetworkApiCryptoAssetsHistory>(
      NetworkApiCryptoAssetsHistory());
  locator.registerFactory<HomeProvider>(() => HomeProvider());
}
