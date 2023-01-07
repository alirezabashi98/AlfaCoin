import 'package:alfa_coin/Model/cryptocurrency_model.dart';
import 'package:alfa_coin/constants/constants.dart';
import 'package:alfa_coin/providers/home_provider.dart';
import 'package:alfa_coin/ui/widget/item_crypto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeProvider _homeProvider = GetIt.I.get<HomeProvider>();

  @override
  void initState() {
    super.initState();
    _homeProvider.loadDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundScreenDark,
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => _homeProvider,
          child: Consumer<HomeProvider>(
            builder: (context, provider, child) {
              return provider.cryptoList.isEmpty
                  ? _shimmerLoading()
                  : getUi(provider);
            },
          ),
        ),
      ),
    );
  }

  getUi(HomeProvider provider) {
    return ListView.builder(
      itemCount: provider.cryptoList.length,
      itemBuilder: (context, index) {
        var list = provider.cryptoList;
        return ItemCrypto(
          crypto: list[index],
        );
      },
    );
  }

  getLoading() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SpinKitSpinningLines(
            color: Colors.white,
            size: 60.0,
          ),
          SizedBox(height: 10),
          Text(
            "Loading...",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  _shimmerLoading() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ItemCrypto(
                    crypto: CryptocurrencyModel(
                      "1",
                      index + 1,
                      "symbol",
                      "name",
                      222.2,
                      222.2,
                      222.2,
                      222.2,
                      222.2,
                      1,
                      222.2,
                    ),
                  );
                },
                itemCount: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _homeProvider.channel.sink.close();
  }
}
