import 'crypto.dart';

CryptoFavorites _favFromJson(Map<String, dynamic> json){
  return CryptoFavorites(favoriteCrypto: json['favorites']);
}

Map<String, dynamic> _favToJson(CryptoFavorites instance) => <String, dynamic>{
  'favorites': instance.favoriteCrypto,
};

class CryptoFavorites{
  final Crypto? favoriteCrypto;

  CryptoFavorites({this.favoriteCrypto});

  factory CryptoFavorites.fromJson(Map<String, dynamic> json) => _favFromJson(json);

  Map<String, dynamic> toJson() => _favToJson(this);
}