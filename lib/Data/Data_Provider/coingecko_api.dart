import 'package:http/http.dart' as http;

class CryptoDataProvider{
 
  static final BaseUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=volume_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h";

  static Future<http.Response> fetchCoins() async{
     final url = Uri.parse(BaseUrl);
     final http.Response cryptoResponse = await http.get(url);
     return cryptoResponse;
 /*    final data = jsonDecode(cryptoResponse.body);

     List<Crypto> coins = [];

    for(int i=0; i<100; i++){
       Crypto coin = Crypto.fromJson(data[i]);
       coins.add(coin);
    }

    for(var i in coins){
      print("${i.symbol}\n");
    }*/
  }
}