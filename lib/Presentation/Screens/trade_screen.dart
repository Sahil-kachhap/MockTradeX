import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mock_tradex/common.dart';
import 'package:mock_tradex/constants.dart';
import '/Presentation/Widgets/slide_act.dart';
import 'package:mock_tradex/constants.dart';

List<bool> orderSelected = [true, false, false, false];
List<bool> percentSelected = [false, false, false, false];

class OrderPage extends StatefulWidget {
  final String? orderSide;
  const OrderPage({
    Key? key,
    this.orderSide,
  }) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Color? pageThemeColor;
  @override
  void initState() {
     pageThemeColor=(orderSide == "BUY") ? Color(0xff286bdb) : Color(0xffef4006);
    super.initState();
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
    super.dispose();
  }


  Widget build(BuildContext context) {
    final GlobalKey<SlideActionState> _key = GlobalKey();
    return Scaffold(
      backgroundColor: kTradeScreenBackgroundColor,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height -
                Scaffold.of(context).appBarMaxHeight!.toDouble(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                                      onChanged: ((val) {
                                        if (double.tryParse(val) != null)
                                          setState(() {
                                            price = double.parse(val);
                                          });
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
                                        if (double.tryParse(val) != null)
                                          setState(() {
                                            amount = double.parse(val);
                                            total = amount * price;
                                          });
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ToggleButtons(
                          onPressed: (int index) {
                            setState(() {
                              for (int buttonIndex = 0;
                                  buttonIndex < percentSelected.length;
                                  buttonIndex++) {
                                if (buttonIndex == index) {
                                  percentSelected[buttonIndex] =
                                      !percentSelected[buttonIndex];
                                } else {
                                  percentSelected[buttonIndex] = false;
                                }
                              }
                            });
                          },
                          children: [
                            Text('25%'),
                            Text('50%'),
                            Text('75%'),
                            Text('100%')
                          ],
                          textStyle: TextStyle(
                            fontSize: kToggleBoxOrderPercentFontSize,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          selectedBorderColor: pageThemeColor,
                          isSelected: percentSelected,
                          color: Color(0xffd9d9d7),
                          selectedColor: pageThemeColor,
                          fillColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
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
                  },
                ),
              ),
            ],
          ),
        ),
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

class ToggleContainer extends StatefulWidget {
  final String? text;
  final int? index;
  final double? fontSize;
  final Color? colorTheme;
  const ToggleContainer({
    Key? key,
    this.text,
    this.index,
    this.fontSize,
    this.colorTheme
  }) : super(key: key);

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
