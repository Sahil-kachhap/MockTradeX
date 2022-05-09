import 'package:flutter/material.dart';
import 'package:mock_tradex/Data/Models/socketResponse.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert' as convert;

class BinanceSocket {

  BinanceOrderBook orderBook=BinanceOrderBook();
  String? symbol;
  BinanceSocket({this.symbol});
 WebSocketChannel? channel ;

    Stream<BinanceOrderBook>  getOrders(String tradePair) {
      channel=WebSocketChannel.connect(Uri.parse('wss://stream.binance.com:9443/stream?streams=${tradePair.toLowerCase()}@depth5@1000ms'),);
      List<String>? bid=['0','0','0','0','0'];
      List<String>? bidQuantity=['0','0','0','0','0',];
      List<String>? ask=['0','0','0','0','0',];
      List<String>? askQuantity=['0','0','0','0','0',];
    return channel!.stream.map((value) {
      final jsonResponse = convert.jsonDecode(value);
        int i=0;
      for (var row in jsonResponse['data']['bids']) {
         bid[i]=(row[0]) ;
         bidQuantity[i]=(row[1]) ;
         i++;
      }
      int j=0;
      for (var row1 in jsonResponse['data']['asks']) {
        ask[j]=(row1[0]) ;
        askQuantity[j]=(row1[1]) ;
        j++;
      }
      orderBook.bid=bid;
      orderBook.bidQuantity=bidQuantity;
      orderBook.askQuantity=askQuantity;
      orderBook.ask=ask;
      return orderBook;

     // print(orderBook.bid);

    });

  }


}


