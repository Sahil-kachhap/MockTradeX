
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mock_tradex/constants.dart';

class CryptoTile extends StatelessWidget {
  final String? cryptoName;
  final String? cryptoSymbol;
  final String? currentPrice;
  final double? priceChange;
  final String? imageUrl;
  final int? index;
  final IconButton? icon;

  const CryptoTile(
      {Key? key,
        this.cryptoName,
        this.cryptoSymbol,
        this.currentPrice,
        this.priceChange,
        this.imageUrl,
        this.index,
        this.icon
      })
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: (index!%2==0)?Color(0xff213047):Color(0xff212c3e),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 0.5,
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(context, color:Colors.black, width: 0.5),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 12, 0),
                  child: CircleAvatar(
                    radius: 18.0,
                    child: Image.network(imageUrl!),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          cryptoSymbol!.toUpperCase(),
                          style: kTickerTextStyle.copyWith(fontSize: 16),

                        ),
                        Text(
                          '/INR',
                          style: kTickerTextStyle.copyWith(
                              fontSize: 10,
                              color: Color(0xFF596777)
                          ),
                        )
                      ],
                    ),
                    Text(
                      cryptoName!,
                      style: kTickerTextStyle.copyWith(
                          fontSize: 12,
                          color: Color(0xFF596777)
                      ),
                    ),

                  ],
                ),

                //changed by sahil

                Container(

                  child: icon,
                )
                //changed by sahil
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '₹'+currentPrice.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: (priceChange! > 0) ? Color(0xff139b4d) : Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                  width: 72.0,
                  height: 32,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        (priceChange! > 0)
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        color: Colors.white,
                        size: 12,
                      ),
                      Text(
                        ' ' + priceChange!.toStringAsFixed(2) + '%',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11.5,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ]),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                left: Divider.createBorderSide(context, color:Colors.black, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
