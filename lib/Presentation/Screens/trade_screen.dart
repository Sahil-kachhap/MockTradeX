//readonly for price

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mock_tradex/Data/Data_Provider/binance_current.dart';
import 'package:mock_tradex/Data/Data_Provider/binance_socket.dart';
import 'package:mock_tradex/Data/Models/orders.dart';
import 'package:mock_tradex/Data/Models/socketResponse.dart';
import 'package:mock_tradex/constants.dart';
import '/Presentation/Widgets/slide_act.dart';

List<bool> orderSelected = [false,true,  false, false];
List<bool> percentSelected = [false, false, false, false];
BinanceSocket? binanceSocket;
BinanceOrderBook? orderBook;
StreamController<BinanceOrderBook> _streamController =
    StreamController<BinanceOrderBook>();
Stream<BinanceOrderBook> stream=_streamController.stream;



class OrderPage extends StatefulWidget {
  final String? orderSide;
  final String? tradePair;

  OrderPage({Key? key, this.orderSide, this.tradePair}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Color? pageThemeColor;
  Timer? timer;
  double currPrice=0;
  @override
  void initState() {
    super.initState();
    binanceSocket = BinanceSocket(symbol: widget.tradePair);
    stream= binanceSocket!.getOrders( widget.tradePair!);

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) async{
      currPrice=await priceUpdate();
      myPriceController.text='${currPrice.toStringAsPrecision(5)}';

      setState(() {
        total = amount * double.tryParse(myPriceController.text)!;
      });
    });
    pageThemeColor = widget.orderSide == 'BUY' ? Color(0xff286bdb) : Color(0xffef4006);
  }
  Future<double> priceUpdate()
  async{
    return getLatestPrice(widget.tradePair!);
  }

  @override
  double price = 0;
  double amount = 0;
  double total = 0;
  final myPriceController = TextEditingController();
  final myAmountController = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myPriceController.dispose();
    myAmountController.dispose();
    binanceSocket!.channel!.sink.close();
    _streamController.close();
    timer?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final GlobalKey<SlideActionState> _key = GlobalKey();
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
                          EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                      decoration: BoxDecoration(
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
                                      readOnly: true,
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
                                          TextInputType.numberWithOptions(
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

                                            },
                                          );
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
                        Row(
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
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
                              SizedBox(
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
                        Text(
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
                                  // setState(() {
                                  //  buttonSelect(0, orderSelected);
                                  // });
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
                                  // setState(() {
                                  //   buttonSelect(1, orderSelected);
                                  // });
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
                                  // setState(() {
                                  //   buttonSelect(2, orderSelected);
                                  // });
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
                                  // setState(() {
                                  //   buttonSelect(3, orderSelected);
                                  // });
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
                        Text(
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
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                            child: Text(
                              '${total.truncateToDouble()}',
                              style: TextStyle(
                                fontSize: 20,
                                color: kTickerWhite,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                  color:
                                      kTradeScreenGreyBoxColorTextFieldBorder),
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
                  color: Color(0xcd13161b),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SlideAction(
                    key: _key,
                    sliderButtonYOffset: 0,
                    text: 'SWIPE TO BUY',
                    textStyle: TextStyle(fontSize: 14, color: Colors.white),
                    outerColor: pageThemeColor,
                    innerColor: Color(0xffffffff),
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
                        Duration(seconds: 1),
                        () => _key.currentState!.reset(),
                      );
                      Order order = Order(
                          cryptoName: "BitCoin",
                          price: myPriceController.text,
                          amount: myAmountController.text,
                          type: OrderType.limitOrder,
                          total: total);
                      order.addOrder(order);
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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: StreamBuilder<BinanceOrderBook>(
            // initialData:orderbook ,
           // stream: binanceSocket!.getOrders(widget.symbol!),
          stream: stream,
            builder: (context, snapshot) {
              return ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    // return Text(
                    //   '${snapshot.connectionState==ConnectionState.active?'${snapshot.data!.ask![index]}':'tryi'}',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //   ),
                    // );
                    return Container(
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
                                  '${snapshot.connectionState == ConnectionState.active ? '${double.tryParse(snapshot.data!.bid![index])!.toStringAsPrecision(7)}' : '0.0'}',
                                  style: TextStyle(
                                    color: Color(0xff286bdb),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '${snapshot.connectionState == ConnectionState.active ? '${double.tryParse(snapshot.data!.bidQuantity![index])!.toStringAsPrecision(5)}' : '0.0'}',
                                  style: TextStyle(
                                    color: Color(0xff286bdb),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${snapshot.connectionState == ConnectionState.active ? '${double.tryParse(snapshot.data!.ask![index])!.toStringAsPrecision(7)}' : '0.0'}',
                                  style: TextStyle(
                                    color: Color(0xffef4006),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '${snapshot.connectionState == ConnectionState.active ? '${double.tryParse(snapshot.data!.askQuantity![index])!.toStringAsPrecision(5)}' : '0.0'}',

                                  style: TextStyle(
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
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Text(
        '${widget.text}',
        style: TextStyle(
          color: orderSelected[widget.index!]
              ? widget.colorTheme!
              : Color(0xffd9d9d7),
          fontSize: widget.fontSize,
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(3)),
          border: Border.all(
            color: orderSelected[widget.index!]
                ? widget.colorTheme!
                : Color(0xff1f1f1f),
          )),
    );
  }
}
