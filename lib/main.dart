import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_tradex/Presentation/Screens/sign_in.dart';
import 'constants.dart';

import 'package:mock_tradex/Presentation/Screens/exchange_screen.dart';
import 'package:mock_tradex/Presentation/Screens/Funds.dart';
import 'package:mock_tradex/Presentation/Screens/quick_buy.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static const List<Widget> _widgetOptions = <Widget>[
    Quickbuy(),
    ExchangeScreen(),
    SignIn(),
    Funds(),
  ];

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      title: 'MockTradeX',
      home: Scaffold(
        backgroundColor: kAppBackgroundColour,
        body: Center(
          child: MyApp._widgetOptions.elementAt(_selectedIndex),
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
