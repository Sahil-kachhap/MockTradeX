CryptoFavorites _favFromJson(Map<String, dynamic> json){
  return CryptoFavorites(cryptoName: json['name'], price: json['price'], priceChange: json['priceChange']);
}

Map<String, dynamic> _favToJson(CryptoFavorites instance) => <String, dynamic>{
  'name': instance.cryptoName,
  'priceChange': instance.priceChange,
  'price': instance.price
};

class CryptoFavorites{
  final String? cryptoName;
  final double? priceChange;
  final String? price; 
  static List<Map<String, dynamic>> jsonFavoriteList = [];
  

  CryptoFavorites({this.cryptoName, this.priceChange, this.price});

  factory CryptoFavorites.fromJson(Map<String, dynamic> json) => _favFromJson(json);

  Map<String, dynamic> toJson() => _favToJson(this);

  storeJsoninList(){
    Map<String, dynamic> json = _favToJson(this);
    jsonFavoriteList.add(json);
  }
}