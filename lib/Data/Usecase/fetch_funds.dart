import 'package:cloud_firestore/cloud_firestore.dart';

class Funds{
  // ignore: unused_field
  List<FundEntity>? _fundList = [];

  Future<void> fetchFunds(String userId) async{
    final Map<String, dynamic> response = await FirebaseFirestore.instance.collection('Users').doc(userId).get().then((value) => value.data()!);
    _fundList = response['funds'];
  }
}

class FundEntity{
  final String? assetName;
  final String? averagePrice;
  final String? quantity;
  final String? symbol;

  FundEntity(this.assetName, this.averagePrice, this.quantity, this.symbol);
}