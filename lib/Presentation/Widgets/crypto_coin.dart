import 'package:mock_tradex/Presentation/Widgets/favorites.dart';

class CryptoCoin{
  final String? cryptoSymbol;
  final String? cryptoName;
  final String? cryptoPrice;
  final double? priceChange;

  CryptoCoin(this.cryptoSymbol, this.cryptoName, this.cryptoPrice, this.priceChange);
}