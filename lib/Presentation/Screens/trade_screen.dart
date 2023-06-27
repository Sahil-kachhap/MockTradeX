import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mock_tradex/Data/Data_Provider/binance_socket.dart';
import 'package:mock_tradex/Data/Models/order.dart';
import 'package:mock_tradex/Data/Models/socketResponse.dart';
import 'package:mock_tradex/constants.dart';
import '/Presentation/Widgets/slide_act.dart';

List<bool> orderSelected = [true, false, false, false];
List<bool> percentSelected = [false, false, false, false];

class OrderPage extends StatefulWidget {
  final String? orderSide;
  final String? tradePair;

  const OrderPage({Key? key, this.orderSide, this.tradePair}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Color? pageThemeColor;

  @override
  void initState() {
    super.initState();
    pageThemeColor =
        widget.orderSide == 'BUY' ? const Color(0xff286bdb) : const Color(0xffef4006);
  }

  @override
  double price = 0;
  double amount = 0;
  double total = 0;
  final myPriceController = TextEditingController();
  final myAmountController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myPriceController.dispose();
    myAmountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<SlideActionState> key = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 2,
        centerTitle: true,
        title: Text('Spot ${widget.orderSide}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15),
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                      decoration: const BoxDecoration(
                        color: kTradeScreenGreyBoxColor,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Price',
                                    style: TextStyle(
                                      color: Color(0xfffeffff),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: TextFormField(
                                      onChanged: ((val) {
                                        if (double.tryParse(val) != null) {
                                          setState(() {
                                            price = double.parse(val);
                                          });
                                        }
                                      }),
                                      controller: myPriceController,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: kTickerWhite,
                                      ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(12),
                                        //max length of 12 characters
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'(^-?\d*\.?\d*)'))
                                      ],
                                      cursorColor: pageThemeColor,
                                      cursorWidth: 2,
                                      enabled: true,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        isCollapsed: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  kTradeScreenGreyBoxColorTextFieldBorder,
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  kTradeScreenGreyBoxColorTextFieldBorder,
                                              width: 1),
                                        ),
                                        hintText: '0',
                                        hintStyle: TextStyle(
                                          fontSize: 20,
                                          color: kHintTextColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Amount',
                                    style: TextStyle(
                                      color: Color(0xfffeffff),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: TextFormField(
                                      controller: myAmountController,
                                      onChanged: ((val) {
                                        if (double.tryParse(val) != null) {
                                          setState(
                                            () {
                                              amount = double.parse(val);
                                              total = amount * price;
                                            },
                                          );
                                          Order order = Order(
                                              cryptoName: "BitCoin",
                                              price: myPriceController.text,
                                              amount: myAmountController.text,
                                              type: OrderType.limitOrder);
                                          order.addOrder(order);
                                        }
                                      }),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: kTickerWhite,
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        LengthLimitingTextInputFormatter(12),
                                        //max length of 12 characters
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'(^-?\d*\.?\d*)'))
                                      ],
                                      cursorColor: pageThemeColor,
                                      cursorWidth: 2,
                                      enabled: true,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        isCollapsed: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  kTradeScreenGreyBoxColorTextFieldBorder,
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  kTradeScreenGreyBoxColorTextFieldBorder,
                                              width: 1),
                                        ),
                                        hintText: '0',
                                        hintStyle: TextStyle(
                                          fontSize: 20,
                                          color: kHintTextColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Order Book',
                              style: TextStyle(
                                color: Color(0xffeaecf0),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Bid',
                                          style: TextStyle(
                                            color: Color(0xb773787f),
                                          ),
                                        ),
                                        Text(
                                          'Qty',
                                          style: TextStyle(
                                            color: Color(0xb773787f),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Ask',
                                          style: TextStyle(
                                            color: Color(0xb773787f),
                                          ),
                                        ),
                                        Text(
                                          'Qty',
                                          style: TextStyle(
                                            color: Color(0xb773787f),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              OrderRows(
                                symbol: widget.tradePair,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 20.0, vertical: 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       ToggleButtons(
                  //         onPressed: (int index) {
                  //           setState(() {
                  //             for (int buttonIndex = 0;
                  //                 buttonIndex < percentSelected.length;
                  //                 buttonIndex++) {
                  //               if (buttonIndex == index) {
                  //                 percentSelected[buttonIndex] =
                  //                     !percentSelected[buttonIndex];
                  //               } else {
                  //                 percentSelected[buttonIndex] = false;
                  //               }
                  //             }
                  //           });
                  //         },
                  //         children: [
                  //           Text('25%'),
                  //           Text('50%'),
                  //           Text('75%'),
                  //           Text('100%')
                  //         ],
                  //         textStyle: TextStyle(
                  //           fontSize: kToggleBoxOrderPercentFontSize,
                  //         ),
                  //         borderRadius: BorderRadius.all(Radius.circular(5)),
                  //         selectedBorderColor: pageThemeColor,
                  //         isSelected: percentSelected,
                  //         color: Color(0xffd9d9d7),
                  //         selectedColor: pageThemeColor,
                  //         fillColor: Colors.black,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Type',
                          style: TextStyle(
                            color: Color(0xfffeffff),
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, //setstate problem
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    buttonSelect(0, orderSelected);
                                  });
                                },
                                child: ToggleContainer(
                                  text: 'Limit',
                                  index: 0,
                                  fontSize: kToggleBoxOrderTypeFontSize,
                                  colorTheme: pageThemeColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    buttonSelect(1, orderSelected);
                                  });
                                },
                                child: ToggleContainer(
                                  text: 'Market',
                                  index: 1,
                                  fontSize: kToggleBoxOrderTypeFontSize,
                                  colorTheme: pageThemeColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    buttonSelect(2, orderSelected);
                                  });
                                },
                                child: ToggleContainer(
                                  text: 'SL',
                                  index: 2,
                                  fontSize: kToggleBoxOrderTypeFontSize,
                                  colorTheme: pageThemeColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    buttonSelect(3, orderSelected);
                                  });
                                },
                                child: ToggleContainer(
                                  text: 'SL-M',
                                  index: 3,
                                  fontSize: kToggleBoxOrderTypeFontSize,
                                  colorTheme: pageThemeColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            color: Color(0xfffeffff),
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                  color:
                                      kTradeScreenGreyBoxColorTextFieldBorder),
                            ),
                            child: Text(
                              '${total.truncateToDouble()}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: kTickerWhite,
                              ),
                            ),
                          ),
                        ),
                        /*
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: TextFormField(
                        focusNode: ,
                        enabled: false,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          color: kTickerWhite,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        cursorColor: Color(0xff2196f4),
                        cursorWidth: 2,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          isCollapsed: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: kTradeScreenGreyBoxColorTextFieldBorder,
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: kTradeScreenGreyBoxColorTextFieldBorder,
                                width: 1),
                          ),
                          hintText: '0',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: kHintTextColor,
                          ),
                        ),
                      ),
                    )*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  color: const Color(0xcd13161b),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Available USD ',
                              style: TextStyle(color: Color(0xb773787f)),
                            ),
                            Icon(
                              Icons.account_balance_wallet_rounded,
                              color: Color(
                                0xb773787f,
                              ),
                              size: 15,
                            ),
                          ],
                        ),
                        Text(
                          '\$99999999',
                          style: TextStyle(color: Color(0xffeaecf0)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SlideAction(
                    key: key,
                    sliderButtonYOffset: 0,
                    text: 'SWIPE TO BUY',
                    textStyle: const TextStyle(fontSize: 14, color: Colors.white),
                    outerColor: pageThemeColor,
                    innerColor: const Color(0xffffffff),
                    sliderButtonIconPadding: 11,
                    sliderRotate: false,
                    height: 65,
                    sliderButtonIcon: Icon(
                      Icons.chevron_right_rounded,
                      size: 36,
                      color: pageThemeColor,
                    ),
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => key.currentState!.reset(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void orderConfirmed() {
    print('ok');
  }

  void buttonSelect(int index, List<bool> isSelected) {
    for (int buttonIndex = 0;
        buttonIndex < orderSelected.length;
        buttonIndex++) {
      if (buttonIndex == index) {
        orderSelected[buttonIndex] = true;
      } else {
        orderSelected[buttonIndex] = false;
      }
    }
  }
}

class OrderRows extends StatefulWidget {
  final String? symbol;
  const OrderRows({Key? key, this.symbol}) : super(key: key);

  @override
  State<OrderRows> createState() => _OrderRowsState();
}

class _OrderRowsState extends State<OrderRows> {
  final StreamController<BinanceOrderBook> _streamController =
      StreamController<BinanceOrderBook>();
  BinanceSocket? binanceSocket;
  BinanceOrderBook? orderbook;

  @override
  void initState() {
    super.initState();
    binanceSocket = BinanceSocket(symbol: widget.symbol);
  }

  @override
  void dispose() {
    super.dispose();
    binanceSocket!.channel!.sink.close();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: StreamBuilder<BinanceOrderBook>(
            // initialData:orderbook ,
            stream: binanceSocket!.getOrders(widget.symbol!),
            builder: (context, snapshot) {
              return ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    // return Text(
                    //   '${snapshot.connectionState==ConnectionState.active?'${snapshot.data!.ask![index]}':'tryi'}',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //   ),
                    // );
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 20,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.connectionState == ConnectionState.active ? double.tryParse(snapshot.data!.bid![index])!.toStringAsPrecision(7) : '0.0',
                                  style: const TextStyle(
                                    color: Color(0xff286bdb),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  snapshot.connectionState == ConnectionState.active ? double.tryParse(snapshot.data!.bidQuantity![index])!.toStringAsPrecision(5) : '0.0',
                                  style: const TextStyle(
                                    color: Color(0xff286bdb),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.connectionState == ConnectionState.active ? double.tryParse(snapshot.data!.ask![index])!.toStringAsPrecision(7) : '0.0',
                                  style: const TextStyle(
                                    color: Color(0xffef4006),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  snapshot.connectionState == ConnectionState.active ? double.tryParse(snapshot.data!.askQuantity![index])!.toStringAsPrecision(5) : '0.0',
                                  style: const TextStyle(
                                    color: Color(0xffef4006),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}

class ToggleContainer extends StatefulWidget {
  final String? text;
  final int? index;
  final double? fontSize;
  final Color? colorTheme;
  const ToggleContainer(
      {Key? key, this.text, this.index, this.fontSize, this.colorTheme})
      : super(key: key);

  @override
  State<ToggleContainer> createState() => _ToggleContainerState();
}

class _ToggleContainerState extends State<ToggleContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          border: Border.all(
            color: orderSelected[widget.index!]
                ? widget.colorTheme!
                : const Color(0xff1f1f1f),
          )),
      child: Text(
        '${widget.text}',
        style: TextStyle(
          color: orderSelected[widget.index!]
              ? widget.colorTheme!
              : const Color(0xffd9d9d7),
          fontSize: widget.fontSize,
        ),
      ),
    );
  }
}
