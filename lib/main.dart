import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_tradex/Data/Repositories/auth_repository.dart';
import 'package:mock_tradex/Data/Repositories/crypto_repository.dart';
import 'package:mock_tradex/Presentation/Screens/front_page.dart';
import 'package:mock_tradex/Presentation/Screens/sign_in.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mock_tradex/Data/Data_Provider/crypto_name_handler.dart';
import 'functions.dart';



List<String> ?n=[];
List<String> ?sy=[];
List<double> ?pr=[];
List<String> ?price=[];
List<String> ?image=[];
List<int>? ind=[];



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  await CryptoNameResolver.getTickerNames();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 @override
 // ignore: must_call_super
 void initState() {
    getdata();
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

