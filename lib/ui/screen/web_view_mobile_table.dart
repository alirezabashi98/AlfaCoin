import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class WebViewMobileAndTablet extends StatefulWidget {
  final String cryptoSymbol;
  const WebViewMobileAndTablet({super.key, required this.cryptoSymbol});

  @override
  State<WebViewMobileAndTablet> createState() => _WebViewMobileAndTabletState();
}

class _WebViewMobileAndTabletState extends State<WebViewMobileAndTablet> {
  late WebViewXController webviewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewX(
          initialContent: 'https://www.tradingview.com/chart/?symbol=BITSTAMP%3A${widget.cryptoSymbol}USD',
          initialSourceType: SourceType.url,
          onWebViewCreated: (controller) => webviewController = controller,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
