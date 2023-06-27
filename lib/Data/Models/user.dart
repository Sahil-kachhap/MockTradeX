import 'package:mock_tradex/Data/Models/favorites.dart';

class CryptoUser{
   final String? name;
   final String? email;
   final String? uid;
   final List<CryptoFavorites>? favorites; 

  CryptoUser({this.name, this.email, this.uid, this.favorites});

 factory CryptoUser.fromJson(Map<String, dynamic> json) => _userFromJson(json);
  Map<String, dynamic> toJson() => _userToJson(this);
}

CryptoUser _userFromJson(Map<String, dynamic> json){
  return CryptoUser(
    name: json['name'] as String,
    email: json['email'] as String,
    uid:  json['uid'] as String,
    favorites: _convertFavorites(json['favorites'] as List<dynamic>)
  );
}

List<CryptoFavorites> _convertFavorites(List<dynamic> favoritesMap){
  final favorites = <CryptoFavorites>[];

  for(final favorite in favoritesMap){
    favorites.add(CryptoFavorites.fromJson(favorite as Map<String, dynamic>));
  }
  return favorites;
}

Map<String, dynamic> _userToJson(CryptoUser user) => <String, dynamic>{
   'name': user.name,
   'email': user.email,
   'uid': user.uid,
   'favorites': _favoritesList(user.favorites)
};

List<Map<String, dynamic>>? _favoritesList(List<CryptoFavorites>? favorites){
  if(favorites == null){
    return null;
  }

  final favMap = <Map<String, dynamic>>[];

  for (var favorite in favorites) {
     favMap.add(favorite.toJson());
   }
  
  return favMap;
}