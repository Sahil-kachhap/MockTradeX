import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
var tickerName ={};
class CryptoNameResolver{

   static Future<Map<dynamic,dynamic>> getTickerNames()async{
    const BaseUrl = "https://api.alternative.me/v2/listings/";

    final url = Uri.parse(BaseUrl);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      for(var crypto in jsonResponse['data'])
      {
        tickerName[crypto['symbol']]=crypto['name'];
      }
      print(tickerName['BTC']);

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return tickerName;
  }
}