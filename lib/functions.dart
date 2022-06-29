import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';

import 'package:mock_tradex/main.dart';

//List<Crypto> cry=<Crypto>[];
//List<String> pointList = <String>[];

void getdata() async{
  var collection = FirebaseFirestore.instance.collection('favourite');
  var querySnapshot = await collection.get();
  for (var queryDocumentSnapshot in querySnapshot.docs) {
    Map<String, dynamic> data = queryDocumentSnapshot.data();
    n?.add(data['cryptoName']);
    sy?.add(data['cryptoSymbol']);
    pr?.add(data['priceChange']);
    price?.add(data['price']);
  }
}
