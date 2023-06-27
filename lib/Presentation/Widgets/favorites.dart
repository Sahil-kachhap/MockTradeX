import 'package:mock_tradex/Presentation/Widgets/crypto_coin.dart';

class Favorites {
  final List<CryptoCoin> _favouriteCryptos = [];
  
  List<CryptoCoin>? get getFavorites => _favouriteCryptos;

  void addFavorites(CryptoCoin crypto) {
    _favouriteCryptos.add(crypto);
  }

  void removeFavorites(CryptoCoin coin){
    _favouriteCryptos.remove(coin);
  }

  void display(){
    if(_favouriteCryptos.isEmpty) {
      print("is Empty");
    } else{
    for(var i in _favouriteCryptos){
       print("${i.cryptoName}\n");
    }
   }
  }
}