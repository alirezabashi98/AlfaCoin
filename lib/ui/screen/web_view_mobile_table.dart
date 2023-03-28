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
      appBar: AppBar(
        title: Text('Alfa Coin (${widget.cryptoSymbol})'),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () => webviewController.goBack(),
            child: const Icon(Icons.arrow_back_rounded),
          ),
           const SizedBox(width: 20),
          GestureDetector(
            onTap: () => webviewController.goForward(),
            child: const Icon(Icons.arrow_forward_rounded),
          ),
           const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: WebViewX(
          initialContent:
              'https://www.tradingview.com/chart/?symbol=BITSTAMP%3A${widget.cryptoSymbol}USD',
          initialSourceType: SourceType.url,
          onWebViewCreated: (controller) => webviewController = controller,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
