import 'package:flutter/material.dart';
import 'package:mock_tradex/constants.dart';

class FundTile extends StatelessWidget {
  const FundTile({
    Key? key,
    required this.averagePrice,
    required this.index,
    required this.cryptoName,
    required this.quantity,
    required this.symbol,
  }) : super(key: key);

  final String averagePrice;
  final int index;
  final String cryptoName;
  final String quantity;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              children: [
                //crypto Icon
                // const CircleAvatar(
                //   backgroundColor: Colors.black,
                //   radius: 18.0,
                //   child: Icon(
                //     CupertinoIcons.bitcoin,
                //     size: 26,
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      cryptoName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kTickerTextStyle.copyWith(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // box percentage
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$ ${double.parse(averagePrice).toStringAsFixed(2)}',
                  style: kTickerTextStyle.copyWith(fontSize: 18),
                  maxLines: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF5CD096),
                      //backgroundBlendMode: BlendMode.luminosity,
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    width: 60.0,
                    height: 27,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        verticalDirection: VerticalDirection.down,
                        children: const [
                          Icon(
                            Icons.arrow_downward_outlined,
                            color: Color(0xff58a700),
                            size: 10,
                          ),
                          Text(
                            '12.55 %',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.5,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //box percentage
              ],
            ),
          ),

          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$ 1203999',
                    style: kTickerTextStyle.copyWith(fontSize: 18),
                  ),
                  Text(
                    "${double.parse(quantity).toStringAsFixed(2)} $symbol",
                    style: kTickerTextStyle.copyWith(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        //color: Color(0xff191D28),
        color: Colors.black,
        border: Border(
          bottom: Divider.createBorderSide(context,
              color: kbackgroundColor, width: 1.5),
        ),
      ),
    );
  }
}
