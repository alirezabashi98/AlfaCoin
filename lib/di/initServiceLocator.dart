import 'package:alfa_coin/providers/home_provider.dart';
import 'package:alfa_coin/service/api/network_api_crypto_assets.dart';
import 'package:alfa_coin/service/fake/network_api_crypto_assets_fake.dart';
import 'package:alfa_coin/service/network_api.dart';
import 'package:get_it/get_it.dart';

void initServiceLocator() {
  GetIt.I.registerSingleton<NetworkApi>(NetworkApiCryptoAssets());
  GetIt.I.registerFactory<HomeProvider>(() => HomeProvider());
}
