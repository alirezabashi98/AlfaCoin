import 'package:alfa_coin/constants/constants.dart';
import 'package:flutter/material.dart';

class ItemTitleCryptoMobile extends StatelessWidget {
  const ItemTitleCryptoMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(color: ColorsApp.grey, fontSize: 11);

    return ListTile(
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
                  'Name',
                  style: style,
                ),
              ),
            ],
          ),
        ),
      ),
      trailing: SizedBox(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
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
            const SizedBox(
              width: 60,
              child: Center(
                child: Icon(
                  Icons.trending_down,
                  size: 24,
                  color: ColorsApp.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
