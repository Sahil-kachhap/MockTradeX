import 'package:flutter/material.dart';
import 'package:mock_tradex/constants.dart';
import 'package:mock_tradex/Data/Repositories/graph_data.dart';
import 'package:mock_tradex/Presentation/Widgets/buysell_box.dart'
    show BuySellBox;

bool notificationIsSelected = false;
bool isFavorite = false;

class GraphPage extends StatefulWidget {
  final String? cryptoSymbol;
  final String? cryptoName;
  final String? cryptoPrice;
  final double? priceChange;
  final double? high_24h;
  final double? low_24h;
  final double? totalVolume;

  const GraphPage({
    Key? key,
    this.cryptoSymbol,
    this.cryptoName,
    this.cryptoPrice,
    this.priceChange,
    this.high_24h,
    this.low_24h,
    this.totalVolume,
  }) : super(key: key);

  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGraphPageBackground,
      appBar: AppBar(
        backgroundColor: kGraphPageBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 2,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(widget.cryptoName!),
                  Text(
                    '/INR',
                    style: kTickerSubTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: isFavorite
                    ? const Icon(
                        Icons.star_rounded,
                        color: Color(0xffe6b10b),
                        size: 26,
                      )
                    : const Icon(
                        Icons.star_outline_rounded,
                        color: Color(0xFF596777),
                        size: 25,
                      ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.cryptoPrice!,
                              style: const TextStyle(
                                  color: kTickerWhite,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  '≈\$${widget.cryptoPrice!}',
                                  style: TextStyle(color: kTickerWhite),
                                ),
                                Text(
                                  ' ${widget.priceChange!.toStringAsPrecision(2)}%',
                                  style: TextStyle(
                                      color: (widget.priceChange! > 0)
                                          ? kBuyPriceGreen
                                          : kSellPriceRed,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '24h High',
                            style: kGraphPageStatsStyle,
                          ),
                          Text(
                            '${widget.high_24h}',
                            style: kGraphPageStatsSubTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '24h Low',
                            style: kGraphPageStatsStyle,
                          ),
                          Text(
                            '${widget.high_24h}',
                            style: kGraphPageStatsSubTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '24h Vol(USDT)',
                            style: kGraphPageStatsStyle,
                          ),
                          const Text(
                            'Volume',
                            style: kGraphPageStatsSubTextStyle,
                          ), //add against vol here
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '24h Vol(${widget.cryptoSymbol})',
                            style: kGraphPageStatsStyle,
                          ),
                          Text(
                            '${widget.totalVolume}',
                            style: kGraphPageStatsSubTextStyle,
                          ), //add the against here
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GraphData(
              cryptoSymbol: widget.cryptoSymbol,
            ),
          ),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            notificationIsSelected = !notificationIsSelected;
                          });
                        },
                        icon: notificationIsSelected
                            ? const Icon(
                                Icons.notifications_on_rounded,
                                color: Color(0xffe6b10b),
                                size: 28,
                              )
                            : const Icon(
                                Icons.notifications_none_rounded,
                                color: Color(0xFF596777),
                                size: 27,
                              ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    BuySellBox(
                      boxText: 'BUY',
                      boxColor: kBuyButtonGreen,
                    ),
                    SizedBox(
                      width: 10,
                    ),

                     BuySellBox(
                        boxText: 'SELL',
                        boxColor: kSellButtonRed,
                      ),

                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*onPageStarted: (url){
if(url.contains('https://amazon.com'))
{
Future.delayed(Duration(milliseconds: 300),(){
controller.evaluateJavascript(
"document.getElementsByTagName('header')[0].style.display='none'");
});
};
},*/
