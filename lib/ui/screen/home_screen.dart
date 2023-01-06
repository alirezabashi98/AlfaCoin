import 'package:alfa_coin/Model/cryptocurrency_model.dart';
import 'package:alfa_coin/constants/constants.dart';
import 'package:alfa_coin/providers/home_provider.dart';
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
        return _getListCryptoItem(
          list[index],
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

  _getListCryptoItem(CryptocurrencyModel crypto) => ListTile(
        title: Text(
          crypto.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorsApp.green,
          ),
        ),
        subtitle: Text(
          crypto.symbol,
          style: const TextStyle(
            color: ColorsApp.grey,
            fontSize: 12,
          ),
        ),
        leading: SizedBox(
          width: 90.0,
          child: Center(
            child: Row(
              children: [
                SizedBox(
                  width: 40.0,
                  child: Text(
                    crypto.rank < 100
                        ? crypto.rank < 10
                            ? "00${crypto.rank}"
                            : "0${crypto.rank}"
                        : crypto.rank.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.grey,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 40.0,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://coinicons-api.vercel.app/api/icon/${crypto.symbol.toLowerCase()}",
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ],
            ),
          ),
        ),
        trailing: SizedBox(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    crypto.priceUsd.toStringAsFixed(2),
                    style: const TextStyle(color: ColorsApp.grey, fontSize: 17),
                  ),
                  Text(
                    "${crypto.changePercent24Hr.toStringAsFixed(2)}%",
                    style: TextStyle(
                      color: _getColorChangePercent(crypto.changePercent24Hr),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 50,
                child: Center(
                  child: _getIconChangePercent(crypto.changePercent24Hr),
                ),
              ),
            ],
          ),
        ),
      );

  _getIconChangePercent(double percentChange) => percentChange <= 0
      ? const Icon(
          Icons.trending_down,
          size: 24,
          color: ColorsApp.red,
        )
      : const Icon(
          Icons.trending_up,
          size: 24,
          color: ColorsApp.green,
        );

  Color _getColorChangePercent(double percentChange) =>
      percentChange <= 0 ? ColorsApp.red : ColorsApp.green;

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
                  return _getListCryptoItem(
                    CryptocurrencyModel(
                      "1",
                      index,
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
