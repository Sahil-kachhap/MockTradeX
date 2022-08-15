import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Screens/profile_screen.dart';
import 'package:mock_tradex/Presentation/Widgets/fund_tile.dart';
import 'package:mock_tradex/constants.dart';
import 'package:mock_tradex/Presentation/Screens/deposit_screen.dart';
import 'dart:developer';

class Funds extends StatefulWidget {
  final dynamic wallet;
  const Funds({Key? key, this.wallet}) : super(key: key);

  @override
  _FundsState createState() => _FundsState();
}

class _FundsState extends State<Funds> {
  int x = 1;
  List<dynamic> orders = [];
  late double averagePrice;

  getOrders() async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection('Users')
            .doc("CSsWq83q2qaFrTh58qyJSFOo30w1")
            .get();
    final Map<String, dynamic>? data = snapshot.data();

    orders = data!['orders'];
    log(orders.toString());
    getCurrentAveragePrice(orders);
  }

  double getCurrentAveragePrice(List<dynamic> orders) {
    List<dynamic> btcList =
        orders.where((element) => element['crypto'] == "Bitcoin").toList();
    //log(btcList.toString());

    double averageTotal = btcList.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + (double.parse(element['total'])));

    double totalQuantity = btcList.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + (double.parse(element['amount']!)));
    averagePrice = averageTotal / totalQuantity;
    return averagePrice;
  }

  Future<void> fetchFunds(String userId) async {
    final Map<String, dynamic> response = await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .get()
        .then((value) => value.data()!);
    List<dynamic> fundList = response['funds'];
    log(fundList.toString());
  }

  @override
  void initState() {
    getOrders();
    averagePrice = getCurrentAveragePrice(orders);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBottomBarColor,
        body: Column(
          children: [
            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   child: Center(
            //     child: GestureDetector(
            //         onTap: (){
            //           Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
            //         },
            //         child: Icon(Icons.account_circle_rounded,size: 70,color: Colors.white,)
            //
            //     ),
            //   ),
            // ),

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 25,
                  ),
                  child: Text(
                    'Portfolio',
                    style: kTickerTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: ExactAssetImage('assets/india.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 2),
                    child: Text(
                      '\$ 33008.98',
                      style: kTickerTextStyle.copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    width: 72.0,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Color(0xFF60D79D),
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          //make it center align.
                          Icons.arrow_downward,
                          color: Colors.green,
                          size: 14,
                        ),
                        Text(
                          '2.5 %',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.5,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //color: Color(0xff1A1E29),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Icon(
                        Icons.animation,
                        size: 22.0,
                        color: kBottomBarTextActive,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Wallet Balance',
                      style: kTickerTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 14),
                  child: Text(
                    "200.0",
                    style: kTickerTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xFF283547),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Deposit_Screen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_box,
                            color: Color(0xFF596777),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Deposit',
                            style: kTickerTextStyle.copyWith(
                                fontSize: 14, color: const Color(0xffefba08)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            //  color: Color(0xff191D28),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
                    child: Text(
                      'Assests',
                      style: kTickerTextStyle.copyWith(fontSize: 14),
                    ),
                  ),

                  Expanded(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Price',
                          style: kTickerTextStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  //an alternative way to to change sized box.

                  Expanded(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Holdings',
                          style: kTickerTextStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<Map<String, dynamic>>(
                  future: FirebaseFirestore.instance
                      .collection('Users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get()
                      .then((value) => value.data()!),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasData) {
                      List<dynamic> funds = snapshot.data!['funds'];
                      funds.sort(
                        (b, a) => double.parse(a['quantity']).compareTo(
                          double.parse(
                            b['quantity'],
                          ),
                        ),
                      );
                      return ListView.builder(
                          itemCount: funds.length,
                          itemBuilder: (context, index) {
                            return FundTile(
                              averagePrice: funds[index]['price'],
                              index: index,
                              cryptoName: funds[index]['name']!,
                              quantity: funds[index]['quantity'],
                              symbol: funds[index]['symbol'],
                            );
                            // Container(
                            //   height: 80,
                            //   child: Text('Bitcoin'),
                            //   width: double.infinity,
                            //   decoration: BoxDecoration(
                            //     color: kFundTileColor,
                            //     border: Border(
                            //       bottom: Divider.createBorderSide(context,
                            //           color: kbackgroundColor, width: 1.5),
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   height: 80,
                            //   //color: Color(0xff191D28),
                            //   child: Text('Bitcoin'),
                            //   width: double.infinity,
                            //   decoration: BoxDecoration(
                            //     // color: Color(0xff191D28),
                            //     color: kFundTileColor,
                            //     border: Border(
                            //       bottom: Divider.createBorderSide(context,
                            //           color: kbackgroundColor, width: 1.5),
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   height: 80,
                            //   // color: Color(0xff191D28),
                            //   child: Text('Bitcoin'),
                            //   width: double.infinity,
                            //   decoration: BoxDecoration(
                            //     // color: Color(0xff191D28),
                            //     color: kFundTileColor,
                            //     border: Border(
                            //       bottom: Divider.createBorderSide(context,
                            //           color: kbackgroundColor, width: 1.5),
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   height: 80,
                            //   //color: Color(0xff191D28),
                            //   child: Text('Bitcoin'),
                            //   width: double.infinity,
                            //   decoration: BoxDecoration(
                            //     // color: Color(0xff191D28),
                            //     color: kFundTileColor,
                            //     border: Border(
                            //       bottom: Divider.createBorderSide(context,
                            //           color: kbackgroundColor, width: 1.5),
                            //     ),
                            //   ),
                            // )
                          });
                    }
                    return Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
