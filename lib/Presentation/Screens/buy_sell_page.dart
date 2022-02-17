import 'package:flutter/material.dart';
import 'package:mock_tradex/constants.dart';
import 'trade_screen.dart';

class BuySellPage extends StatefulWidget {
  final String? pageTitle;
  const BuySellPage({
    Key? key,
    this.pageTitle,
  }) : super(key: key);

  @override
  _BuySellPageState createState() => _BuySellPageState();
}

class _BuySellPageState extends State<BuySellPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          titleSpacing: 2,
          centerTitle: true,
          title: Text('Spot'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Tab(

                  text: ('BUY'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Tab(
                  text: ('SELL'),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: kAppBackgroundColour,
        body: TabBarView(
          children: [
            OrderPage(typeOfOrder: 'BUY',),
            OrderPage(typeOfOrder: 'SELL',),
          ],
        ),
      ),
    );
  }
}
