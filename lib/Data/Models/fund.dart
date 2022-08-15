import 'package:mock_tradex/Data/Models/orders.dart';

class Fund{
  final String? cryptoName;
  final String? price;
  final String? priceChange;
  final String? holdings;
  final String? quantity;

  Fund(this.cryptoName, this.price, this.priceChange, this.holdings, this.quantity);
}