import 'dart:convert';
import 'package:http/http.dart';
import 'package:mock_tradex/Data/Data_Provider/binance_api.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';

   Map<String,bool> m={

   };
 // List<Crypto> x=CryptoRepository.getCryptoCoins() as List<Crypto> ;
  //x=CryptoRepository.getCryptoCoins();
 class add{
   void helper() async {
     final Response response = await CryptoDataProvider.fetchCoins();
     final data = jsonDecode(response.body);

     List<Crypto> coins = [];



     for (int i = 0; i < 100; i++) {
       Crypto coin = Crypto.fromJson(data[i]);
       coins.add(coin);
     }


     for(var i in coins){
      m.putIfAbsent("${i.name}", () => false);
     }
     print(m);

   }


 }

