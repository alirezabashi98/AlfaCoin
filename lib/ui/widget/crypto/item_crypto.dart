import 'package:alfa_coin/Model/cryptocurrency_model.dart';
import 'package:alfa_coin/constants/constants.dart';
import 'package:alfa_coin/utility/format_number.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemCrypto extends StatelessWidget {
  ItemCrypto({Key? key, required this.crypto}) : super(key: key);
  final CryptocurrencyModel crypto;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 10);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Table(
            columnWidths: <int, TableColumnWidth>{
              0: const FixedColumnWidth(80),
              1: const FixedColumnWidth(90),
              2: const FlexColumnWidth(),
              if (constraints.maxWidth > 500 && constraints.maxWidth < 1100) ...{
                3: const FixedColumnWidth(82),
                4: const FixedColumnWidth(82),
                5: const FixedColumnWidth(100),
                6: const IntrinsicColumnWidth(),
              }else if (constraints.maxWidth >= 1100) ...{
                3: const FixedColumnWidth(100),
                4: const FixedColumnWidth(100),
                5: const FixedColumnWidth(100),
                6: const FixedColumnWidth(100),
                7: const FixedColumnWidth(100),
                8: const IntrinsicColumnWidth(),
                9: const IntrinsicColumnWidth(),
              } else ...{
                3: const FixedColumnWidth(100),
                4: const IntrinsicColumnWidth(),
              }
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          crypto.rank < 100
                              ? crypto.rank < 10
                                  ? "00${crypto.rank}"
                                  : "0${crypto.rank}"
                              : crypto.rank.toString(),
                          maxLines: 1,
                          style: style.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://assets.coincap.io/assets/icons/${(crypto.symbol.toLowerCase() == 'ustc') ? 'ust' : crypto.symbol.toLowerCase()}@2x.png",
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          crypto.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.green,
                            fontSize: 15,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          crypto.symbol,
                          maxLines: 1,
                          style: style.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  if (constraints.maxWidth > 500) ...{
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '\$${formatNumber(crypto.marketCapUsd)}',
                        style: style.copyWith(
                          fontSize: 13,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '\$${formatNumber(crypto.vwap24Hr)}',
                        style: style.copyWith(
                          fontSize: 13,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  },
                  if (constraints.maxWidth >= 1100) ...{
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '\$${formatNumber(crypto.supply)}',
                        style: style.copyWith(
                          fontSize: 13,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '\$${formatNumber(crypto.volumeUsd24Hr)}',
                        style: style.copyWith(
                          fontSize: 13,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  },
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          crypto.priceUsd.toStringAsFixed(2),
                          maxLines: 1,
                          style: style.copyWith(fontSize: 17),
                        ),
                        Text(
                          "${crypto.changePercent24Hr.toStringAsFixed(2)}%",
                          maxLines: 1,
                          style: TextStyle(
                            color: _getColorChangePercent(
                                crypto.changePercent24Hr),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 24,
                    height: 24,
                    child: Center(
                      child: _getIconChangePercent(crypto.changePercent24Hr),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _getIconChangePercent(double percentChange) => percentChange <= 0
      ? const Icon(
          Icons.trending_down,
          color: ColorsApp.red,
        )
      : const Icon(
          Icons.trending_up,
          color: ColorsApp.green,
        );

  Color _getColorChangePercent(double percentChange) =>
      percentChange <= 0 ? ColorsApp.red : ColorsApp.green;
}
