class BinanceOrderBook{

  List<String>? bid=[];
  List<String>? bidQuantity=[];
  List<String>? ask=[];
  List<String>? askQuantity=[];

  BinanceOrderBook({this.bid, this.bidQuantity, this.ask, this.askQuantity});
}
class Price{
  String? price;
  Price({this.price});
}