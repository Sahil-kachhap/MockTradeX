import 'dart:convert';
import 'package:http/http.dart';
import 'package:mock_tradex/Data/Data_Provider/coingecko_api.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';
Map<String?,Crypto>? m={

};
class CryptoRepository {


  Future<List<Crypto>> getCryptoCoins() async {
    final Response response = await CryptoDataProvider.fetchCoins();
    final data = jsonDecode(response.body);

    List<Crypto> coins = [];

      for (int i = 0; i < 100; i++) {
        Crypto coin = Crypto.fromJson(data[i]);
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
}
