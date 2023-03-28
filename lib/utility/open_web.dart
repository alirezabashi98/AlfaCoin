import 'package:desktop_webview_window/desktop_webview_window.dart';

openWebInDesktop(String cryptoSymbol) async {
  final webview = await WebviewWindow.create(
    configuration: CreateConfiguration(
      title: cryptoSymbol,
    ),
  );

  webview.launch(
    "https://www.tradingview.com/chart/?symbol=BITSTAMP%3A${cryptoSymbol}USD",
  );
}
