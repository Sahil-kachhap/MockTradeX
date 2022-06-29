import 'dart:convert';
import 'package:http/http.dart';
import 'package:mock_tradex/Data/Data_Provider/binance_api.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';
Map<String?,Crypto>? m={

};
class CryptoRepository {
  Future<List<Crypto>> getCryptoCoins() async {
    final Response response = await CryptoDataProvider.fetchCoins();
    final data = jsonDecode(response.body);

    List<Crypto> coins = [];

    for (var c in data) {
      String symbol = c['symbol'];
      double price = double.tryParse(c['lastPrice'])!;
      if (symbol.endsWith('USDT')&&price!=0) {
        Crypto coin = Crypto.fromJson(c);
        coins.add(coin);
        print(coin.name);
        m?.addEntries([
          MapEntry(coin.name, coin),
        ]);

      }

    print(m
    );
      return coins;


    }
    return coins;

  }
}
