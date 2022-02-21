import 'package:flutter/material.dart';

import 'package:mock_tradex/Presentation/Screens/Funds.dart';
import 'package:mock_tradex/Presentation/Screens/exchange_screen.dart';
import 'package:mock_tradex/Presentation/Screens/quick_buy.dart';
import 'package:mock_tradex/Presentation/Screens/sign_in.dart';

import 'package:mock_tradex/constants.dart';

class Frontpage extends StatefulWidget {
  const Frontpage({Key? key}) : super(key: key);
  @override
  _FrontpageState createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
 
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Quickbuy(),
    ExchangeScreen(),
    SignIn(),
   Funds()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColour,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Settings',
          onPressed: () {

          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_balance),
            tooltip: 'Currency',
            onPressed: () {},
          ),
        ],
        title: const Text(
          'MockTradeX',
        ),
        backgroundColor: kAppBarColour,
      ),
      body:Container(),

    );
  }
}
