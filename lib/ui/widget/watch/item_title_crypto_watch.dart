import 'package:alfa_coin/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemTitleCryptoWatch extends StatelessWidget {
  const ItemTitleCryptoWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 11);
    var minFontSize = 5.0;
    var maxFontSize = 13.0;

    return ListTile(
      title: AutoSizeText(
        maxLines: 1,
        minFontSize: minFontSize,
        maxFontSize: maxFontSize,
        'Name',
        style: style,
      ),
      trailing: SizedBox(
        width: 40.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AutoSizeText(
                  maxLines: 1,
                  "Price",
                  minFontSize: minFontSize,
                  maxFontSize: maxFontSize,
                  style: style,
                ),
                AutoSizeText(
                  maxLines: 1,
                  minFontSize: minFontSize,
                  maxFontSize: maxFontSize,
                  "Change (24Hr)",
                  style: style,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
