// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:mock_tradex/main.dart';
import 'package:mock_tradex/Presentation/Widgets/firebase.dart';
import 'package:mock_tradex/constants.dart';
import 'package:mock_tradex/Data/Repositories/graph_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mock_tradex/Presentation/Widgets/firebase.dart';
import 'package:mock_tradex/Presentation/Widgets/buysell_box.dart'

    show BuySellBox;

bool notificationIsSelected = false;

bool isFavorite = false;


class GraphPage extends StatefulWidget {
  final String? cryptoSymbol;
  final String? cryptoName;
  final String? cryptoPrice;
  final double? priceChange;
  final double? high_24h;
  final double? low_24h;
  final double? totalVolume;

  const GraphPage({
    Key? key,
    this.cryptoSymbol,
    this.cryptoName,
    this.cryptoPrice,
    this.priceChange,
    this.high_24h,
    this.low_24h,
    this.totalVolume,
  }) : super(key: key);

  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  _demoFunc() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setBool(widget.cryptoName!, true);
  }
  _demoRetrieve() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    setState(() {
       prefs.getBool(widget.cryptoName!)!;
    });

  }
  _demoDelete() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.remove(widget.cryptoName!);
  }
  _democheck() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(widget.cryptoName!)) {
      setState(() {
        isFavorite=true;
      });
    }else{
      setState(() {
        isFavorite=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
  _democheck();

    return Scaffold(

      backgroundColor: kGraphPageBackground,
      appBar: AppBar(
        backgroundColor: kGraphPageBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 2,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(widget.cryptoName!),
                  Text(
                    '/INR',
                    style: kTickerSubTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                  icon: isFavorite
                      ?
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xffe6b10b),
                    size: 26,
                  )
                      :
                  const Icon(
                    Icons.star_outline_rounded,
                    color: Color(0xFF596777),
                    size: 25,
                  ),

                onPressed: () {

                  setState(() {

                    // m.update(widget.cryptoName!, (value) => true);
                    isFavorite=!isFavorite;


                  });
                  isFavorite
                      ?
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xffe6b10b),
                    size: 26,
                  )
                      :
                  const Icon(
                    Icons.star_outline_rounded,
                    color: Color(0xFF596777),
                    size: 25,
                  );

                  if(isFavorite){
                    _demoFunc();



                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        scrollable: true,
                          backgroundColor: Colors.black45,
                        content: Column(
                          children: [
                            GestureDetector(
                              child: const ListTile(
                                  title: Text('Watch List 1',style: TextStyle(
                                    color: Colors.white,
                                  ),)
                              ),
                              onTap: () {
                                _firestore.collection('favourite').add({
                                  'crypto':widget.cryptoName!,
                                 // 'isfavorite':true,
                                });
                                l?.insert(i++, widget.cryptoName!);
                                Navigator.pop(context);
                              },

                            ),
                            GestureDetector(
                              child: const ListTile(
                                  title: Text('Watch List 2',style: TextStyle(
                                    color: Colors.white,
                                  ),)
                              ),
                              onTap: () {
                                _firestore.collection('favourite1').add({
                                  'crypto':widget.cryptoName!,
                                 // 'isfavorite':true,
                                });
                                l1?.insert(k++, widget.cryptoName!);
                                Navigator.pop(context);
                              },

                            ),

                          ],
                        ),

                      ),
                    );
                    //  print(l);
                  }else{
                _demoDelete();
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        scrollable: true,
                         backgroundColor: Colors.black45,
                        content: Column(
                          children: [
                            GestureDetector(
                              child: const ListTile(
                                  title: Text('Watch List 1',style: TextStyle(
                                    color: Colors.white,
                                  ),)
                              ),
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection("favourite")
                                    .where("crypto", isEqualTo : widget.cryptoName!)
                                    .get().then((value){
                                  value.docs.forEach((element) {
                                    FirebaseFirestore.instance.collection("favourite").doc(element.id).delete().then((value){

                                    });
                                  });
                                });
                                l?.remove(widget.cryptoName!);
                                Navigator.pop(context);
                               // _demoDelete();
                              },

                            ),
                            GestureDetector(
                              child: const ListTile(
                                  title: Text('Watch List 2',style: TextStyle(
                                    color: Colors.white,
                                  ),)
                              ),
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection("favourite1")
                                    .where("crypto", isEqualTo : widget.cryptoName!)
                                    .get().then((value){
                                  value.docs.forEach((element) {
                                    FirebaseFirestore.instance.collection("favourite1").doc(element.id).delete().then((value){

                                    });
                                  });
                                });
                                l1?.remove(widget.cryptoName!);
                                Navigator.pop(context);
                               // _demoDelete();
                              },

                            ),
                          ],
                        ),

                      ),
                    );
                    // code not written for removing.
                   }
                },

              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.cryptoPrice!,
                              style: const TextStyle(
                                  color: kTickerWhite,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  '≈\$${widget.cryptoPrice!}',
                                  style: TextStyle(color: kTickerWhite),
                                ),
                                Text(
                                  ' ${widget.priceChange!.toStringAsPrecision(2)}%',
                                  style: TextStyle(
                                      color: (widget.priceChange! > 0)
                                          ? kBuyPriceGreen
                                          : kSellPriceRed,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '24h High',
                            style: kGraphPageStatsStyle,
                          ),
                          Text(
                            '${widget.high_24h}',
                            style: kGraphPageStatsSubTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '24h Low',
                            style: kGraphPageStatsStyle,
                          ),
                          Text(
                            '${widget.high_24h}',
                            style: kGraphPageStatsSubTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '24h Vol(USDT)',
                            style: kGraphPageStatsStyle,
                          ),
                          const Text(
                            'Volume',
                            style: kGraphPageStatsSubTextStyle,
                          ), //add against vol here
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '24h Vol(${widget.cryptoSymbol})',
                            style: kGraphPageStatsStyle,
                          ),
                          Text(
                            '${widget.totalVolume}',
                            style: kGraphPageStatsSubTextStyle,
                          ), //add the against here
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GraphData(
              cryptoSymbol: widget.cryptoSymbol,
            ),
          ),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            notificationIsSelected = !notificationIsSelected;
                          });
                        },
                        icon: notificationIsSelected
                            ? const Icon(
                                Icons.notifications_on_rounded,
                                color: Color(0xffe6b10b),
                                size: 28,
                              )
                            : const Icon(
                                Icons.notifications_none_rounded,
                                color: Color(0xFF596777),
                                size: 27,
                              ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    BuySellBox(
                      boxText: 'BUY',
                      boxColor: kBuyButtonGreen,
                    ),
                    SizedBox(
                      width: 10,
                    ),

                     BuySellBox(
                        boxText: 'SELL',
                        boxColor: kSellButtonRed,
                      ),

                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*onPageStarted: (url){
if(url.contains('https://amazon.com'))
{
Future.delayed(Duration(milliseconds: 300),(){
controller.evaluateJavascript(
"document.getElementsByTagName('header')[0].style.display='none'");
});
};
},*/
