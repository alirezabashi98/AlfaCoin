import 'package:alfa_coin/constants/constants.dart';
import 'package:flutter/material.dart';

class ItemTitleCryptoDesktop extends StatelessWidget {
  const ItemTitleCryptoDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14);

    return ListTile(
      title: Text(
        'Name',
        style: style,
      ),
      leading: SizedBox(
        width: 82.0,
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 40.0,
                child: Text(
                  'Rank',
                  style: style,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 38.0,
                child: Text(
                  '',
                  style: style,
                ),
              ),
            ],
          ),
        ),
      ),
      trailing: SizedBox(
        width: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            SizedBox(
              width: 80,
              child: Text(
                "Market Cap",
                style: style,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 80,
              child: Text(
                "Supply",
                style: style,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Volume (24Hr)",
                    style: style,
                  ),
                  Text(
                    "VWAP (24Hr)",
                    style: style,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Price",
                    style: style,
                  ),
                  Text(
                    "Change (24Hr)",
                    style: style,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 50,
              child: Center(
                child: Icon(
                  Icons.trending_up,
                  size: 24,
                  color: style.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
