import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_tradex/Data/Repositories/auth_repository.dart';
import 'package:mock_tradex/Data/Repositories/crypto_repository.dart';
import 'package:mock_tradex/Presentation/Screens/front_page.dart';
import 'package:mock_tradex/Presentation/Screens/sign_in.dart';
import 'package:mock_tradex/Presentation/Screens/quick_buy.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'functions.dart';


List<String>? n=[];
List<String>? sy=[];
List<double>? pr=[];
List<String>? price=[];
List<String>? image=[];
List<int>? index=[];



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
   //fun.method();
    //const Quickbuy();
  }



// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => CryptoRepository()),
          RepositoryProvider(create: (context) => AuthRepository()),
        ],
        child: MaterialApp(
            theme: ThemeData(
              primaryColor: Colors.deepPurpleAccent,
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
            ),
            debugShowCheckedModeBanner: false,
            title: 'MockTradeX',
            home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return const Frontpage();
                }
                return const SignIn();
              },
            )
           // const SignIn()
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

