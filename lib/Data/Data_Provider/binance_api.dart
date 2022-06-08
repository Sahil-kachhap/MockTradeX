import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mock_tradex/Data/Models/crypto.dart';

class CryptoDataProvider{
 
  static final BaseUrl = "https://api.binance.com/api/v3/ticker/24hr";

  static Future<http.Response> fetchCoins() async{
     final url = Uri.parse(BaseUrl);
     final http.Response cryptoResponse = await http.get(url);
    return cryptoResponse;
  /*   final data = jsonDecode(cryptoResponse.body);

     List<Crypto> coins = [];

    for(int i=0; i<100; i++){
       Crypto coin = Crypto.fromJson(data[i]);
       coins.add(coin);
    }

    for(var i in coins){
      print("${i.symbol}\n");
    } */
  }
}