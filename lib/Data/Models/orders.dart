import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum OrderType { buy, sell, marketOrder, limitOrder }

class Order {
  final String? cryptoName;
  final String? price;
  final String? amount;
  final double? total;
  final String? type;
  final String? orderTime;
  final String? orderSide;
  final String? symbol;
  final String? tradePair;
  static List<Map<String, String?>> ordersList = [];
  static List<Map<String, String?>> fundList = [];
  final userId = FirebaseAuth.instance.currentUser!.uid;

  Order(
      {this.cryptoName,
      this.price,
      this.amount,
      this.type,
      this.total,
      this.orderTime,
      this.tradePair,
      this.symbol,
      this.orderSide});

  addOrder(Order order, double balance) {
    ordersList.add({
      "crypto": order.cryptoName,
      "price": order.price,
      "amount": order.amount,
      "type": order.type.toString(),
      "total": order.total.toString(),
      "orderSide": order.orderSide,
      "orderTime": order.orderTime,
    });

    addOrdersToFireStore(userId);
    updateFunds(order);
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'wallet_balance': balance.toString(),
    });
  }

  addOrdersToFireStore(String? userId) {
    final document = FirebaseFirestore.instance.collection('Users').doc(userId);

    document.update({
      "orders": FieldValue.arrayUnion(ordersList),
    });
  }

  updateFunds(Order order) async {
    final document = FirebaseFirestore.instance.collection('Users').doc(userId);
    final Map<String, dynamic> documentData =
        await document.get().then((value) => value.data()!);
    List<dynamic> funds = documentData['funds'];
    String orderCryptoName = order.cryptoName!;
    dynamic requiredAsset;

    List<dynamic> assetExist =
        funds.where((asset) => asset['name'] == orderCryptoName).toList();

    if (assetExist.isEmpty) {
      funds.add({
        'name': order.cryptoName,
        'price': order.price,
        'symbol': order.symbol,
        'quantity': order.amount
      });

      document.update({
        'funds': funds,
      });
    } else {
      funds.removeWhere((asset) {
        if (asset['name'] == orderCryptoName) {
          requiredAsset = asset;
        }
        return asset['name'] == orderCryptoName;
      });

      double currentAverageSum = double.parse(requiredAsset!['price']!) *
          double.parse(requiredAsset!['quantity']!);
      double newAverageSum = currentAverageSum +
          (double.parse(order.price!) * double.parse(order.amount!));
      double newQuantity = double.parse(requiredAsset!['quantity']!) +
          double.parse(order.amount!);
      double newAveragePrice = newAverageSum / newQuantity;

      requiredAsset!['price'] = newAveragePrice.toString();
      requiredAsset!['quantity'] = newQuantity.toString();
      funds.add(requiredAsset!);

      log(funds.toString());

      document.update({
        "funds": funds,
      });
    }
  }
}
