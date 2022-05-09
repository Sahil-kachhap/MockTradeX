import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';
import 'package:mock_tradex/Presentation/Screens/quick_buy.dart';
import 'package:mock_tradex/Presentation/Widgets/crypto_tile.dart';
import 'package:mock_tradex/main.dart';


List<Crypto> cry=[];
class func{

  static void method() async{

    var collection = FirebaseFirestore.instance.collection('favourite');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      // Crypto c=Crypto.fromJson1(data);
      n?.add(data['cryptoName']);
      sy?.add(data['cryptoSymbol']);
      pr?.add(data['priceChange']);
      price?.add(data['price']);
      image?.add(data['image']);



      // String str=data['cryptoName'];

      //  n?.add(str);
      // sy?.add( data['cryptoSymbol']);
      // pr?.add(data['priceChange'] );
      // price?.add(data['price']);
      // image?.add(data['image']);
      // index?.add(data['index']);


    }


    // print('sahil');


//  print(l);

  }

}