import 'package:alfa_coin/Model/cryptocurrency_model.dart';
import 'package:alfa_coin/constants/constants.dart';
import 'package:alfa_coin/providers/home_provider.dart';
import 'package:alfa_coin/ui/widget/tablet/item_crypto.dart';
import 'package:alfa_coin/ui/widget/tablet/item_title_crypto.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../di/init_service_locator.dart';
import 'detail_mobile_screen.dart';

class HomeTabletScreen extends StatefulWidget {
  const HomeTabletScreen({super.key});

  @override
  State<HomeTabletScreen> createState() => _HomeTabletScreenState();
}

class _HomeTabletScreenState extends State<HomeTabletScreen> {
  final HomeProvider _homeProvider = locator.get();

  @override
  void initState() {
    super.initState();
    _homeProvider.loadDate();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child:  Scaffold(
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
      ),
    );
  }

  getUi(HomeProvider provider) {
    return Column(
      children: [
        const ItemTitleCrypto(),
        Expanded(
          child: ListView.builder(
            itemCount: provider.cryptoList.length,
            itemBuilder: (context, index) {
              var list = provider.cryptoList;
              var item = list[index];
              return GestureDetector(
                onTap: () {
                  try {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LineChartSample2(
                          crypto: item,
                        ),
                      ),
                    );
                  } catch (ex) {
                    print('error');
                  }
                },
                child: ItemCrypto(
                  crypto: item,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _shimmerLoading() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const ItemTitleCrypto(),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: ColorsApp.red,
              highlightColor: ColorsApp.green,
              enabled: true,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ItemCrypto(
                    crypto: CryptocurrencyModel(
                      "1",
                      index + 1,
                      "btc",
                      "btc",
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                    ),
                  );
                },
                itemCount: 16,
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
