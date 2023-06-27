import 'package:cloud_firestore/cloud_firestore.dart';

enum OrderType{
   buy,
   sell,
   marketOrder,
   limitOrder
}

class Order{
  final String? cryptoName;
  final String? price;
  final String? amount;
  double? total = 0;
  final OrderType? type;
  static List<Map<String, String?>> ordersList = [];

  Order({this.cryptoName, this.price, this.amount, this.type});

  addOrder(Order order){
    ordersList.add({
      "crypto": order.cryptoName,
      "price": order.price,
      "amount": order.amount,
      "type": order.type.toString(),
    });

    addOrdersToFireStore();
  }

  addOrdersToFireStore(){
    final document = FirebaseFirestore.instance.collection('Users').doc('9CeGpcJRE6524J6q9Y1W');

    document.update({
      "orders": ordersList
    });
  }
}



