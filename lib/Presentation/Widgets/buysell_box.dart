import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Screens/sign_in.dart';
import 'package:mock_tradex/constants.dart';
import 'package:mock_tradex/Presentation/Screens/buy_sell_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BuySellBox extends StatelessWidget {
  final String? boxText;
  final Color? boxColor;
  const BuySellBox({
    Key? key,
    this.boxText,
    this.boxColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = FirebaseAuth.instance.currentUser;

    return GestureDetector(
      onTap: () async {
        if (firebaseUser == null) {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignIn(),
            ),
          );
        }
        else {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BuySellPage(pageTitle: boxText,),
            ),
          );
        }

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Container(
          child: Center(
              child: Text(
            boxText!,
            style: kBuyBox,
          )),
          height: 42,
          width: 110,
          decoration: BoxDecoration(
              color: boxColor!,
              borderRadius: BorderRadius.all(Radius.circular(4))),
        ),
      ),
    );
  }
}
