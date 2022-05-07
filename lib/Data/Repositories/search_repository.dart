import 'dart:convert';
import 'package:http/http.dart';
import 'package:mock_tradex/Data/Data_Provider/binance_api.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';

class SearchRepository{

  static Future<List<Crypto>> getCryptoSearch({required String query}) async {
    final Response response = await CryptoDataProvider.fetchCoins();
    final data = jsonDecode(response.body);

    List<Crypto> results=[];
    //results = data.map((e) => Crypto.fromJson(e)).toList();
    for (int i = 0; i < 100; i++) {
      Crypto coin = Crypto.fromJson(data[i]);
      String? s=coin.name;
      String? st=coin.symbol;
      if(s!.toLowerCase().contains(query.toLowerCase()) || st!.toLowerCase().contains(query.toLowerCase())){
        results.add(coin);
      }
    }

    return results;
  }
}