import 'package:flutter/material.dart';

import 'package:mock_tradex/constants.dart';

class Frontpage extends StatefulWidget {
  const Frontpage({Key? key}) : super(key: key);
  @override
  _FrontpageState createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
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
