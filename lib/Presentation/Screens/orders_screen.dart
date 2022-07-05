import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_tradex/Buisness_logic/auth/bloc/auth_bloc.dart';
import 'package:mock_tradex/Data/Repositories/auth_repository.dart';
import 'package:mock_tradex/constants.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final String? userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kAppBackgroundColour,
            title: TabBar(tabs: [
              Tab(
                child: Text(
                  "Open Orders",
                  style:
                      GoogleFonts.poppins(letterSpacing: 1.0, fontSize: 18.0),
                ),
              ),
              Tab(
                child: Text(
                  "Order History",
                  style:
                      GoogleFonts.poppins(letterSpacing: 1.0, fontSize: 18.0),
                ),
              ),
            ]),
          ),
          backgroundColor: kbackgroundColor,
          body: TabBarView(
            children: [
              _buildOrderHistoryListView(),
              FutureBuilder<Map<String, dynamic>>(
                future: FirebaseFirestore.instance
                    .collection('Users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .get()
                    .then((value) => value.data()!),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    final orders = snapshot.data!['orders'];
                    log(orders.toString());

                    return ListView.builder(
                      itemCount: orders!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${orders[index]['crypto']}/USDT",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 7),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: Text("Market ${orders[index]['orderSide']}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              letterSpacing: 1.0)),
                                    ),
                                    Text(
                                      "${DateTime.parse(orders[index]['orderTime']).hour} : ${DateTime.parse(orders[index]['orderTime']).minute}   ${DateTime.parse(orders[index]['orderTime']).day}-${DateTime.parse(orders[index]['orderTime']).month}",
                                      style: GoogleFonts.poppins(
                                          letterSpacing: 1.0,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Order Price",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.0, color: Colors.white),
                                    ),
                                    Text(
                                      "${orders[index]['price']}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.0, color: Colors.white),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Amount ",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.0, color: Colors.white),
                                    ),
                                    Text(
                                      "${orders[index]['amount']}",
                                      style: GoogleFonts.poppins(
                                          letterSpacing: 1.0,
                                          fontSize: 14.0,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.0, color: Colors.white),
                                    ),
                                    Text(
                                      double.parse(orders[index]['total'])
                                          .toStringAsFixed(2),
                                      style: GoogleFonts.poppins(
                                          letterSpacing: 1.0,
                                          fontSize: 14.0,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ListView _buildOrderHistoryListView() {
  return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "RMRK/USDT",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 15.0),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          border: Border.all(color: Colors.white)),
                      child: Text("Market SELL",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10.0,
                              letterSpacing: 1.0)),
                    ),
                    Text(
                      "2:14 24-02",
                      style: GoogleFonts.poppins(
                          letterSpacing: 1.0, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order Price",
                      style: GoogleFonts.poppins(
                          fontSize: 14.0, color: Colors.white),
                    ),
                    Text(
                      "44.82",
                      style: GoogleFonts.poppins(
                          fontSize: 14.0, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount ",
                      style: GoogleFonts.poppins(
                          fontSize: 14.0, color: Colors.white),
                    ),
                    Text(
                      "10",
                      style: GoogleFonts.poppins(
                          letterSpacing: 1.0,
                          fontSize: 14.0,
                          color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: GoogleFonts.poppins(
                          fontSize: 14.0, color: Colors.white),
                    ),
                    Text(
                      "44.82",
                      style: GoogleFonts.poppins(
                          letterSpacing: 1.0,
                          fontSize: 14.0,
                          color: Colors.white),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  //color: Colors.blueAccent,
                  height: 60,
                  width: 120,
                  child: TextButton(
                    style: ButtonStyle(
                        // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blueAccent),
                        // foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context)
                          .add(SignOutRequested());
                    },
                    child: const Text('Log Out', style: kTickerTextStyle),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
