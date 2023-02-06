import 'package:alfa_coin/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemTitleCryptoTablet extends StatelessWidget {
  const ItemTitleCryptoTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(color: ColorsApp.grey, fontSize: 13);
    var minFontSize = 7.0;
    var maxFontSize = 14.0;

    return ListTile(
      title: AutoSizeText(
        maxLines: 1,
        minFontSize: minFontSize,
        maxFontSize: maxFontSize,
        'Name',
        style: style,
      ),
      leading: SizedBox(
        width: 15.w,
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 8.w,
                child: Text(
                  'Rank',
                  style: style,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 6.w,
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
        width: 60.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            SizedBox(
              width: 70,
              child: AutoSizeText(
                maxLines: 1,
                minFontSize: minFontSize,
                maxFontSize: maxFontSize,
                "Market Cap",
                style: style,
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 80,
              child:
              AutoSizeText(
                maxLines: 1,
                minFontSize: minFontSize,
                maxFontSize: maxFontSize,
                "supply",
                style: style,
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 14.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AutoSizeText(
                    "Price",
                    style: style,
                    maxLines: 1,
                    minFontSize: minFontSize,
                    maxFontSize: maxFontSize,
                  ),
                  AutoSizeText(
                    "Change (24Hr)",
                    style: style,
                    maxLines: 1,
                    minFontSize: minFontSize,
                    maxFontSize: maxFontSize,
                  ),
                ],
              ),
            ),
            SizedBox(width: 1.w),
            SizedBox(
              width: 8.w,
              child: const Center(
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
