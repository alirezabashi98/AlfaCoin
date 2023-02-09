import 'package:alfa_coin/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemTitleCryptoMobile extends StatelessWidget {
  const ItemTitleCryptoMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 11);
    var minFontSize = 7.0;
    var maxFontSize = 14.0;
    var maxFontSizeRank = 16.0;

    return ListTile(
      title: AutoSizeText(
        'Name',
        maxLines: 1,
        minFontSize: minFontSize,
        maxFontSize: maxFontSize,
        style: style,
      ),
      leading: SizedBox(
        width: 20.w,
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 8.w,
                child: AutoSizeText(
                  'Rank',
                  minFontSize: minFontSize,
                  maxFontSize: maxFontSizeRank,
                  maxLines: 1,
                  style: style,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 7.w,
                child: Text(
                  ' ',
                  style: style,
                ),
              ),
            ],
          ),
        ),
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
            SizedBox(width: 2.w),
            SizedBox(
              width: 5.w,
              child: Center(
                child: Icon(
                  Icons.trending_up,
                  color: style!.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
