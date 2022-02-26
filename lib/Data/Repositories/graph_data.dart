import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mock_tradex/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GraphData extends StatefulWidget {
  final String? cryptoSymbol;

  const GraphData({Key? key, this.cryptoSymbol}) : super(key: key);

  @override
  _GraphDataState createState() => _GraphDataState();
}

class _GraphDataState extends State<GraphData> {
  late WebViewController controller;

  void _loadLocalHtml() async {
    final url = Uri.dataFromString(
      """
   <html>
   <head>
       <meta name="viewport" content="width=360, initial-scale=0.9">
   </head>
   <body>
   <div class="tradingview-widget-container">
   <div id="tradingview_7a395"></div>
   <div class="tradingview-widget-copyright"><a href="https://in.tradingview.com/symbols/ETHUSDT/?exchange=BINANCE" rel="noopener" target="_blank"></a></div>
   <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
   <script type="text/javascript">
   new TradingView.widget(
       {
       "autosize": true,
       "symbol": "BINANCE:${widget.cryptoSymbol}USD",  //usd global binance
       "timezone": "Asia/Kolkata",
       "theme": "dark",
       "style": "2",
       "locale": "in",
       "toolbar_bg": "#f1f3f6",
       "enable_publishing": false,
       "range": "1D",
       "save_image": false,
       "container_id": "tradingview_7a395"
       }
   );
   </script>
   </div>
   </body>
   </html>""",
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();
    controller.loadUrl(url);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        backgroundColor: kGraphPageBackground,
        initialUrl: 'http://google.com',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          this.controller = controller;
          _loadLocalHtml();
        },
      ),
    );
  }
}