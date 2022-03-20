import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mock_tradex/Data/Models/favorites.dart';

class FireStoreRepository{
  static final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Users');

  Stream<QuerySnapshot> getData(){
    return _collectionReference.snapshots();
  }

  static Future<DocumentReference> addData(CryptoFavorites favorites){
    return _collectionReference.add(favorites.toJson());
  }

}