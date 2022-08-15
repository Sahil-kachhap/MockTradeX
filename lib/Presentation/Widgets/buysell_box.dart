import 'package:flutter/material.dart';
import 'package:mock_tradex/constants.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        child: Center(
          child: Text(
            boxText!,
            style: kBuyBox,
          ),
        ),
        height: 42,
        width: 110,
        decoration: BoxDecoration(
          color: boxColor!,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }
}
