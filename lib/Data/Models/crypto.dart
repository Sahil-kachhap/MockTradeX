import 'package:mock_tradex/Data/Data_Provider/crypto_name_handler.dart';

class Crypto {
  String? symbol;
  String? name;
  String? image;
  String? tradePair;
  double? currentPrice;
  double? totalVolume;
  double? priceChangePercentage24h;
  double? high_24h;
  double? low_24h;


  Crypto(
      {
      this.symbol,
      this.name,
      this.image,
        this.tradePair,
      this.currentPrice,
      this.totalVolume,
      this.priceChangePercentage24h,
      this.high_24h,
      this.low_24h,});

  Crypto.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    tradePair=symbol;
    symbol=symbol!.replaceAll('USDT', '');
    name = tickerName[symbol]??symbol;
    //image = json['image'];
    currentPrice = double.tryParse(json['lastPrice']);
    totalVolume = double.tryParse(json['volume']);
    priceChangePercentage24h = double.tryParse(json['priceChangePercent']);
    high_24h = double.tryParse(json['highPrice']);
    low_24h = double.tryParse(json['lowPrice']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['name'] = name;
    data['image'] = image;
    data['current_price'] = currentPrice;
    data['total_volume'] = totalVolume;
    data['price_change_percentage_24h'] = priceChangePercentage24h;
    data['high_24h'] =high_24h;
    data['low_24h'] =low_24h;
    return data;
  }

  static List<Crypto> coinsFromsApi(dynamic snapshot){
   final List<Crypto> coins = [];

    for(int i=0; i<100; i++){
      Crypto coin = Crypto.fromJson(snapshot[i]);
      print(coin);
      coins.add(coin);
    }

    return coins;
  }
}