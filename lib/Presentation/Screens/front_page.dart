import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Screens/Funds.dart';
import 'package:mock_tradex/Presentation/Screens/exchange_screen.dart';
import 'package:mock_tradex/Presentation/Screens/quick_buy.dart';

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
    Text(
      'Code for Orders',
      style: optionStyle,
    ),
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
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Settings',
          onPressed: () {},
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
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart),
            label: 'Quick Buy',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Exchange',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Orders',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Funds',
            backgroundColor: Colors.indigo,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
