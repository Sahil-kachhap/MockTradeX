import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Screens/profile_screen.dart';
import 'package:mock_tradex/constants.dart';
import 'package:mock_tradex/Presentation/Screens/deposit_screen.dart';

class Funds extends StatefulWidget {
  const Funds({Key? key}) : super(key: key);

  @override
  _FundsState createState() => _FundsState();
}

class _FundsState extends State<Funds> {
  int x = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBottomBarColor,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Profile()));
                    },
                    child: const Icon(
                      Icons.account_circle_rounded,
                      size: 70,
                      color: Colors.white,
                    )),
              ),
            ),

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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Profile()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: ExactAssetImage('assets/friends.png'),
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          //make it center align.
                          Icons.arrow_downward,
                          color: Colors.green,
                          size: 14,
                        ),
                        Text(
                          '2.5 ' '%',
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
                    Text('Total Assets in INR',
                        style: kTickerTextStyle.copyWith(fontSize: 16)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 14),
                  child: Text('2300.00',
                      style: kTickerTextStyle.copyWith(fontSize: 16)),
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
              child: ListView(
                children: [
                  Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      //color: Color(0xff191D28),
                      color: Colors.black,
                      border: Border(
                        bottom: Divider.createBorderSide(context,
                            color: kbackgroundColor, width: 1.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 18.0,
                                child: Icon(
                                  CupertinoIcons.bitcoin,
                                  size: 26,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Bitcoinnnnnnnnnnnnn',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      kTickerTextStyle.copyWith(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // box percentage
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '\$ 92788888',
                                style: kTickerTextStyle.copyWith(fontSize: 18),
                                maxLines: 1,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF5CD096),
                                    //backgroundBlendMode: BlendMode.luminosity,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                  ),
                                  width: 60.0,
                                  height: 27,
                                  child: const Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.ideographic,
                                      verticalDirection: VerticalDirection.down,
                                      children: [
                                        Icon(
                                          Icons.arrow_downward_outlined,
                                          color: Color(0xff58a700),
                                          size: 10,
                                        ),
                                        Text(
                                          '12.55 ' '%',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.5,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //box percentage
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '\$ 1203999',
                                  style:
                                      kTickerTextStyle.copyWith(fontSize: 18),
                                ),
                                Text(
                                  '2999999 BTC',
                                  style: kTickerTextStyle.copyWith(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
