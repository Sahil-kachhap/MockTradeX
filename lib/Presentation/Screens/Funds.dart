import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mock_tradex/constants.dart';

class Funds extends StatefulWidget {
  const Funds({Key? key}) : super(key: key);

  @override
  _FundsState createState() => _FundsState();
}

class _FundsState extends State<Funds> {
  int x = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Scaffold(

        backgroundColor: kbackgroundColor,
        body: Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(

                  padding: EdgeInsets.only(left: 25, top: 5),
                  child: Text(
                    'Portfolio',
                    style: kTickerTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 19),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.add_box,
                          color: Color(0xFF596777),
                        ),
                        padding: EdgeInsets.only(top: 5),
                        iconSize: 30,
                      ),
                      Text(
                        'Deposit',
                        style: kTickerTextStyle.copyWith(
                            fontSize: 12, color: Color(0xFF596777)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 2),
                    child: Text(
                      '\$ 33008.98',
                      style: kTickerTextStyle.copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    width: 72.0,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Color(0xFF60D79D),
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          //make it center align.
                          Icons.arrow_downward,
                          color: Colors.green,
                          size: 14,
                        ),
                        Text(
                          '2.5 ' + '%',
                          style: const TextStyle(
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
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.animation,
                        size: 22.0,
                        color: kBottomBarTextActive,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Total Assets in INR',
                        style: kTickerTextStyle.copyWith(fontSize: 16)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(right: 14),
                  child: Text('2300.00',
                      style: kTickerTextStyle.copyWith(fontSize: 16)),
                ),
              ],
            ),

            SizedBox(
              height: 50,
            ),
            //  color: Color(0xff191D28),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Assests',
                    style: kTickerTextStyle.copyWith(fontSize: 15),
                  ),
                  Row(
                    children: [
                      Text(
                        'Prices',
                        style: kTickerTextStyle.copyWith(fontSize: 15),
                      ),
                      //an alternative way to to change sized box.
                      SizedBox(
                        width: 65,
                      ),
                      Text(
                        'Holdings',
                        style: kTickerTextStyle.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 80,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: CircleAvatar(
                            backgroundColor: kFundTileColor,
                            radius: 18.0,
                            child: Icon(
                              CupertinoIcons.bitcoin,
                              size: 26,
                            ),
                          ),
                        ),

                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                            child: Text(
                              'Bitcoin',
                              style: kTickerTextStyle.copyWith(fontSize: 18),
                            )),
                        // box percentage
                        Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.fromLTRB(82, 8, 12, 0),
                                child: Text(
                                  '\$ 9278',
                                  style: kTickerTextStyle.copyWith(fontSize: 18),
                                )),
                            Container(
                              margin: EdgeInsets.only(top: 5, left: 68),
                              decoration: BoxDecoration(
                                color: Color(0xFF5CD096),
                                //backgroundBlendMode: BlendMode.luminosity,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                              ),
                              width: 55.0,
                              height: 25,
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    //make it center align.
                                    Icons.arrow_downward,
                                    color: Colors.green,
                                    size: 10,
                                  ),
                                  Text(
                                    '2.5 ' + '%',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.5,
                                        color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            //box percentage
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                                padding: const EdgeInsets.fromLTRB(55, 8, 3, 5),
                                child: Text(
                                  '\$ 12039',
                                  style: kTickerTextStyle.copyWith(fontSize: 18),
                                )),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(55, 0, 5, 0),
                              child: Text(
                                '2 BTC',
                                style: kTickerTextStyle.copyWith(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      //color: Color(0xff191D28),
                      color: kFundTileColor,
                      border: Border(
                        bottom: Divider.createBorderSide(context,
                            color: kbackgroundColor, width: 1.5),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    child: Text('Bitcoin'),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kFundTileColor,
                      border: Border(
                        bottom: Divider.createBorderSide(context,
                            color: kbackgroundColor, width: 1.5),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    //color: Color(0xff191D28),
                    child: Text('Bitcoin'),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Color(0xff191D28),
                      color: kFundTileColor,
                      border: Border(
                        bottom: Divider.createBorderSide(context,
                            color: kbackgroundColor, width: 1.5),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    // color: Color(0xff191D28),
                    child: Text('Bitcoin'),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Color(0xff191D28),
                      color: kFundTileColor,
                      border: Border(
                        bottom: Divider.createBorderSide(context,
                            color: kbackgroundColor, width: 1.5),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    //color: Color(0xff191D28),
                    child: Text('Bitcoin'),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Color(0xff191D28),
                      color: kFundTileColor,
                      border: Border(
                        bottom: Divider.createBorderSide(context,
                            color: kbackgroundColor, width: 1.5),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
