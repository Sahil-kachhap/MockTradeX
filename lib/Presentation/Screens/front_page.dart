import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Screens/funds.dart';
import 'package:mock_tradex/Presentation/Screens/exchange_screen.dart';
import 'package:mock_tradex/Presentation/Screens/quick_buy.dart';
import 'package:mock_tradex/constants.dart';
import 'orders_screen.dart';
import 'package:mock_tradex/functions.dart';
import 'news.dart';

class Frontpage extends StatefulWidget {

  const Frontpage({Key? key}) : super(key: key);
  @override
  _FrontpageState createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
 
  int _selectedIndex = 0;
  PageController? _pageController;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    NEWSPage(),
    Quickbuy(),
    ExchangeScreen(),
    OrderScreen(),
    Funds(),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex,);
   // fun.method();
    super.initState();
  }
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kAppBackgroundColour,
        body: PageView(
          controller: _pageController,
          children: _widgetOptions,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 24.5,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(

              icon: Icon(
                Icons.newspaper,
              ),
              label: 'News',
            ),
            BottomNavigationBarItem(

              icon: Icon(
                Icons.bubble_chart,
              ),
              label: 'Quick Buy',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.swap_horizontal_circle,
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
                Icons.wallet_travel_outlined,
              ),
              label: 'Funds',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kBottomBarTextActive,
          unselectedItemColor: kBottomBarTextinActive,
          onTap: (_selectedPageIndex){
            setState(() {
              _selectedIndex = _selectedPageIndex;
              _pageController!.jumpToPage(_selectedIndex);
            });
          },
          selectedIconTheme: IconThemeData(color: kBottomBarTextActive),
          unselectedIconTheme: IconThemeData(color: kBottomBarTextinActive),
          backgroundColor: kBottomBarColor,
        ),
      );
  }
}