import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_tradex/Presentation/Screens/funds.dart';
import 'package:mock_tradex/Presentation/Screens/exchange_screen.dart';
import 'package:mock_tradex/Presentation/Screens/quick_buy.dart';
import 'package:mock_tradex/Presentation/Screens/sign_in.dart';
import 'package:mock_tradex/constants.dart';
import 'orders_screen.dart';

class Frontpage extends StatefulWidget {
  static const List<Widget> _widgetOptions = <Widget>[
    Quickbuy(),
    ExchangeScreen(),
    OrderScreen(),
    Funds(),
  ];
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
        body: Center(
          child: Frontpage._widgetOptions.elementAt(_selectedIndex),
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
      );
  }
}