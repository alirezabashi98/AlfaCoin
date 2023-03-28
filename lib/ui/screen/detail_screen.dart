import 'package:alfa_coin/Model/crypto_history.dart';
import 'package:alfa_coin/constants/constants.dart';
import 'package:alfa_coin/di/init_service_locator.dart';
import 'package:alfa_coin/service/api/network_api_crypto_assets_history.dart';
import 'package:alfa_coin/utility/format_number.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../Model/cryptocurrency_model.dart';

class LineChartDesktopScreen extends StatefulWidget {
  final CryptocurrencyModel crypto;

  const LineChartDesktopScreen({super.key, required this.crypto});

  @override
  State<LineChartDesktopScreen> createState() => _LineChartDesktopScreenState();
}

class _LineChartDesktopScreenState extends State<LineChartDesktopScreen> {
  String interval = 'm1';
  late Size sizeScreen;
  late TextStyle style;

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  List<Color> gradientColors2 = [
    const Color(0xffe62340),
    const Color(0xffd30260),
  ];

  double maxY = 0;

  final INetworkApiCryptoAssetsHistory _getCryptoList = locator.get();

  @override
  Widget build(BuildContext context) {
    style = Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 10);
    sizeScreen = MediaQuery.of(context).size;
    return ThemeSwitchingArea(
      child: Scaffold(
        body: SafeArea(
          child: FutureBuilder<List<CryptoHistoryModel>>(
            future: _getCryptoList.getHistoryCrypto(widget.crypto.id, interval),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      _showChart(snapshot.data!),
                      _detailsCrypto(),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _showChart(List<CryptoHistoryModel> _list) {
    for (var item in _list) {
      if (item.priceUsd > maxY) maxY = item.priceUsd;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: sizeScreen.height > 600
                ? sizeScreen.width < 1000 ? 1.85/1 : 3
                : sizeScreen.height > 460
                    ? 4
                    : 6,
            child: DecoratedBox(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 24, left: 24, top: 24, bottom: 12),
                child: LineChart(
                  mainData(_list),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Column(
              children: [
                Text(
                  "\$${(formatNumber(maxY))}",
                  style: style.copyWith(fontSize: 15),
                ),
                Text(
                  "${widget.crypto.changePercent24Hr.toStringAsFixed(2)}%",
                  style: TextStyle(
                    color:
                        _getColorChangePercent(widget.crypto.changePercent24Hr),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailsCrypto() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: double.infinity),
          Text(
            "Details :",
            style: style.copyWith(fontSize: 15),
            textAlign: TextAlign.left,
          ),
          ListTile(
            title: Text(
              'Market Cap',
              style: style.copyWith(
                fontSize: 15,
              ),
            ),
            trailing: Text(
              widget.crypto.marketCapUsd.toStringAsFixed(2),
              style: style.copyWith(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Volume (24Hr)',
              style: style.copyWith(
                fontSize: 15,
              ),
            ),
            trailing: Text(
              widget.crypto.volumeUsd24Hr.toStringAsFixed(2),
              style: style.copyWith(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Supply',
              style: style.copyWith(
                fontSize: 15,
              ),
            ),
            trailing: Text(
              widget.crypto.supply.toStringAsFixed(2),
              style: style.copyWith(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'VWAP (24Hr)',
              style: style.copyWith(
                fontSize: 15,
              ),
            ),
            trailing: Text(
              widget.crypto.vwap24Hr.toStringAsFixed(2),
              style: style.copyWith(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorChangePercent(double percentChange) =>
      percentChange <= 0 ? ColorsApp.red : ColorsApp.green;

  LineChartData mainData(List<CryptoHistoryModel> _list) {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((barSpot) {
              final flSpot = barSpot;
              TextAlign textAlign = TextAlign.center;
              return LineTooltipItem(
                'Price : \$${(flSpot.y.toStringAsFixed(2))} \n Date : ${_list[flSpot.spotIndex].date}',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                textAlign: textAlign,
              );
            }).toList();
          },
        ),
      ),
      gridData: FlGridData(
        show: true,
      ),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: [
            ...List.generate(
              _list.length,
              (index) => FlSpot(
                _list[index].time.toDouble(),
                _list[index].priceUsd,
              ),
            ),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: _getLinearGradient(_list),
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: _getLinearGradient(_list)
                  .map((color) => color.withOpacity(0.2))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  List<Color> _getLinearGradient(List<CryptoHistoryModel> _list) =>
      ((_list[0].priceUsd < _list[_list.length - 1].priceUsd)
          ? gradientColors
          : gradientColors2);
}
