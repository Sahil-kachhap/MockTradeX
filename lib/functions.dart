import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';
import 'package:mock_tradex/Presentation/Screens/quick_buy.dart';
import 'package:mock_tradex/Presentation/Widgets/crypto_tile.dart';
import 'package:mock_tradex/main.dart';

import 'Data/Repositories/crypto_repository.dart';


List<Crypto> cry=<Crypto>[];
List<String> pointList = <String>[];

void getdata() async{
  await FirebaseFirestore.instance.collection("Users").doc('j4uzSIS8rXKT1AxvJC8S').get().then((value){

    // first add the data to the Offset object
    for (var element in List.from(value.get('favorite'))) {
      // String data = new Offset(element);

      //then add the data to the List<Offset>, now we have a type Offset
      pointList.add(element);
    }

  });
  String? cryp=m?[pointList[0]]?.name;

  print(cryp);
}

class fun{




}