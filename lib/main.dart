import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Presentation/Screens/front_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
      home: const Frontpage(),
    );
  }
}
