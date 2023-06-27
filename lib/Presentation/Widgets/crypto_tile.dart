import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Screens/graph_page.dart';
import 'package:mock_tradex/constants.dart';


import 'package:cached_network_image/cached_network_image.dart';

// name too long or price too long overlow issue
class CryptoTile extends StatefulWidget {
  final String? cryptoName;
  final String? cryptoSymbol;
  final String? currentPrice;
  final String? tradePair;
  final double? priceChange;
  final String? imageUrl;
  final int? index;
  final double? high_24h;
  final double? low_24h;
  final double? totalVolume;

  const CryptoTile({
    Key? key,
    this.cryptoName,
    this.cryptoSymbol,
    this.tradePair,
    this.currentPrice,
    this.priceChange,
    this.imageUrl,
    this.index,
    this.high_24h,
    this.low_24h,
    this.totalVolume,
  }) : super(key: key);

  @override
  State<CryptoTile> createState() => _CryptoTileState();
}

class _CryptoTileState extends State<CryptoTile> {
  @override
  Widget build(BuildContext context) {
    String cryptoImageLink = widget.cryptoSymbol!.toLowerCase();
    String cryptoNameLink =
        widget.cryptoName!.toLowerCase().replaceAll(" ", "-");
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GraphPage(
              cryptoSymbol: widget.cryptoSymbol,
              cryptoName: widget.cryptoName,
              tradePair: widget.tradePair,
              cryptoPrice: widget.currentPrice,
              priceChange: widget.priceChange,
              high_24h: widget.high_24h,
              low_24h: widget.low_24h,
              totalVolume: widget.totalVolume,
              imageurl: widget.imageUrl,
              index: widget.index,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        color: const Color(0xff080c10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                border: Border(
                  bottom: Divider.createBorderSide(context,
                      color: Colors.black, width: 0.5),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.black,
                        child: CachedNetworkImage(
                          // imageUrl: imageUrl!,
                          imageUrl:
                              "https://assets.coincap.io/assets/icons/$cryptoImageLink@2x.png",
                          //imageUrl: "https://cryptologos.cc/logos/${cryptoNameLink}-${cryptoImageLink}-logo.png?v=022",
                          //imageUrl: "https://cryptocurrencyliveprices.com/img/${cryptoImageLink}-$cryptoNameLink.png",
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Image.asset('assets/generic.png'),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.cryptoSymbol!,
                                style: kTickerTextStyle.copyWith(fontSize: 16),
                              ),
                              Text(
                                '/USD',
                                style: kTickerSubTextStyle.copyWith(
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                          Text(
                            widget.cryptoName!,
                            style: kTickerTextStyle.copyWith(
                                fontSize: 12, color: const Color(0xFF596777)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        '\$${widget.currentPrice}',
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: (widget.priceChange! > 0)
                            ? const Color(0xff139b4d)
                            : Colors.red,
                        borderRadius: const BorderRadius.all(Radius.circular(3)),
                      ),
                      width: 72.0,
                      height: 32,
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            (widget.priceChange! > 0)
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: Colors.white,
                            size: 12,
                          ),
                          Text(
                            ' ${widget.priceChange!.toStringAsFixed(2)}%',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11.5,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              )
            ]),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  left: Divider.createBorderSide(context,
                      color: Colors.black, width: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
