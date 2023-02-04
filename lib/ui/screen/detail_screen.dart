import 'package:alfa_coin/Model/crypto_history.dart';
import 'package:alfa_coin/constants/constants.dart';
import 'package:alfa_coin/di/init_service_locator.dart';
import 'package:alfa_coin/service/api/network_api_crypto_assets_history.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../Model/cryptocurrency_model.dart';

class LineChartSample2 extends StatefulWidget {
  final CryptocurrencyModel crypto;

  const LineChartSample2({super.key, required this.crypto});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  String interval = 'd1';

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  List<Color> gradientColors2 = [
    const Color(0xffe62340),
    const Color(0xffd30260),
  ];

  double maxY = 0;
  bool showAvg = false;

  final INetworkApiCryptoAssetsHistory _getCryptoList = locator.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundScreenDark,
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 30.0,
              child: CachedNetworkImage(
                imageUrl:
                "https://assets.coincap.io/assets/icons/${(widget.crypto.symbol.toLowerCase() == 'ustc') ? 'ust' : widget.crypto.symbol.toLowerCase()}@2x.png",
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.crypto.name,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  widget.crypto.symbol,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: ColorsApp.backgroundScreenDark,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<CryptoHistoryModel>>(
          future: _getCryptoList.getHistoryCrypto(widget.crypto.id, interval),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  _showChart(snapshot.data!),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Technical Chart"),
                  ),
                  _detailsCrypto(),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _showChart(List<CryptoHistoryModel> _list) {
    print(_list[0].priceUsd - _list[_list.length - 1].priceUsd);
    for (var item in _list) {
      if (item.priceUsd > maxY) maxY = item.priceUsd;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1.70,
            child: DecoratedBox(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 24, left: 24, top: 24, bottom: 12),
                child: LineChart(
                  showAvg ? avgData() : mainData(_list),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Column(
              children: [
                Text(
                  "\$${(maxY.toStringAsFixed(3) == "0.000") ? (maxY.toStringAsFixed(6) == "0.000") ? maxY.toStringAsFixed(9) : maxY.toStringAsFixed(6) : maxY.toStringAsFixed(3)}",
                  style: const TextStyle(color: Colors.white, fontSize: 14),
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
        children: const [
          SizedBox(width: double.infinity),
          Text(
            "Details :",
            style: TextStyle(color: ColorsApp.grey, fontSize: 14),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Color _getColorChangePercent(double percentChange) =>
      percentChange <= 0 ? ColorsApp.red : ColorsApp.green;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('2022-01-18', style: style);
        break;
      case 1:
        text = const Text('2022-01-19', style: style);
        break;
      case 2:
        text = const Text('2022-01-20', style: style);
        break;
      case 3:
        text = const Text('2022-01-21', style: style);
        break;
      case 4:
        text = const Text('2022-01-22', style: style);
        break;
      case 5:
        text = const Text('2022-01-23', style: style);
        break;
      case 6:
        text = const Text('2022-01-24', style: style);
        break;
      case 7:
        text = const Text('2022-01-25', style: style);
        break;
      case 8:
        text = const Text('2022-01-26', style: style);
        break;
      case 9:
        text = const Text('2022-01-27', style: style);
        break;
      case 10:
        text = const Text('2022-01-28', style: style);
        break;
    // 2022-01-29 , 2022-01-30 , 2022-01-31 ,  2022-02-01 , 2022-02-02 ,
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '\$1';
        break;
      case 20:
        text = '\$4000';
        break;
      case 40:
        text = '\$8000';
        break;
      case 50:
        text = '\$10000';
        break;
      case 60:
        text = '\$12000';
        break;
      case 80:
        text = '\$16000';
        break;
      case 100:
        text = '\$20,000';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(List<CryptoHistoryModel> _list) {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((barSpot) {
              final flSpot = barSpot;
              TextAlign textAlign = TextAlign.center;
              return LineTooltipItem(
                '\$${(flSpot.y.toStringAsFixed(3) == "0.000") ? (flSpot.y.toStringAsFixed(6) == "0.000000") ? flSpot.y.toStringAsFixed(9) : flSpot.y.toStringAsFixed(6) : flSpot.y.toStringAsFixed(3)}',
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
        show: false,
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

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: false,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      maxX: 1,
      minX: 0,
      minY: 0,
      maxY: 2,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 1),
            const FlSpot(1, 1),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(1643414400000.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
