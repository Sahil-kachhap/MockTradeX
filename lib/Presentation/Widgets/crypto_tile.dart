import 'package:flutter/material.dart';

class CryptoTile extends StatelessWidget {
  final String? cryptoName;
  final String? cryptoSymbol;
  final String? currentPrice;
  final String? priceChange;
  final String? imageUrl;

  const CryptoTile(
      {Key? key,
      this.cryptoName,
      this.cryptoSymbol,
      this.currentPrice,
      this.priceChange,
      this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CircleAvatar(
          radius: 18.0,
          child: Image.network(imageUrl!),
        ),
      ),
      Expanded(
        child: ListTile(
          title: Text(cryptoName!),
          subtitle: Text(cryptoSymbol! + '/' + currentPrice.toString(),
              style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Container(
              width: 70.0,
              padding: const EdgeInsets.all(8.0),
              color: Colors.green,
              child: Text(
                double.parse(priceChange!).toStringAsFixed(2) + '%',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
      ),
    ]);
  }
}
