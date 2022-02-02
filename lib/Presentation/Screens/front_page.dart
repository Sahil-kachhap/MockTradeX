import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Screens/exchange_screen.dart';
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
    Text(
      'Code for quick buy',
      style: optionStyle,
    ),
    ExchangeScreen(),
    Text(
      'Code for Orders',
      style: optionStyle,
    ),
    Text(
      'Code for Funds',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xff151d27),
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
          backgroundColor: kAppBarColour,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'INR',
              ),
              Tab(
                text: 'USDT',
              ),
              Tab(text: 'WRX'),
            ],
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 24.5,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bubble_chart,
              ),
              label: 'Quick Buy',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
              ),
              label: 'Exchange',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
              ),
              label: 'Funds',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kBottomBarTextActive,
          unselectedItemColor: kBottomBarTextinActive,
          onTap: _onItemTapped,
          selectedIconTheme: IconThemeData(color: kBottomBarTextActive),
          unselectedIconTheme: IconThemeData(color: kBottomBarTextinActive),
          backgroundColor: kBottomBarColor,
        ),
      ),
    );
  }
}
