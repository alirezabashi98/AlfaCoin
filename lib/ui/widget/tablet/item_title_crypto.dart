import 'package:flutter/material.dart';

class ItemTitleCrypto extends StatelessWidget {
  const ItemTitleCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 10);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Table(
          columnWidths: <int, TableColumnWidth>{
            0: FixedColumnWidth(80),
            1: FixedColumnWidth(90),
            2: FlexColumnWidth(),
            if (constraints.maxWidth > 500) ...{
              3: FixedColumnWidth(82),
              4: FixedColumnWidth(82),
              5: FixedColumnWidth(100),
              6: IntrinsicColumnWidth(),
            } else ...{
              3: FixedColumnWidth(100),
              4: IntrinsicColumnWidth(),
            }
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  height: 20,
                  child: Text(
                    'Rank',
                    style: style.copyWith(fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    'Name',
                    style: style.copyWith(fontSize: 13),
                  ),
                ),
                const Spacer(),
                if (constraints.maxWidth > 500) ...{
                  Text(
                    'Market Cap',
                    style: style.copyWith(
                      fontSize: 13,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    'VMAP (24Hr)',
                    style: style.copyWith(
                      fontSize: 13,
                    ),
                    maxLines: 1,
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
                        'Price',
                        style: style.copyWith(fontSize: 13),
                      ),
                      Text(
                        'Change (24hr)',
                        style: style.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.trending_up,
                    color: style.color,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
