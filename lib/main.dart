import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_tradex/Data/Repositories/crypto_repository.dart';
import 'package:mock_tradex/Presentation/Screens/sign_in.dart';
import 'package:mock_tradex/Presentation/Screens/quick_buy.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

List<String>? l = [" "];
List<String>? l1 = [" "];
int i = 1;
int k = 1;
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
    method();
    method1();
    const Quickbuy();
  }

  void method() async {
    var collection = FirebaseFirestore.instance.collection('favourite');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      String str = data.values.toString();

      l?.insert(i, str);
      i++;
    }

    //  print(l);
  }

  void method1() async {
    var coll1 = FirebaseFirestore.instance.collection('favourite1');
    var querySnapshot1 = await coll1.get();
    for (var queryDocumentSnapshot in querySnapshot1.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      String str = data.values.toString();

      l1?.insert(k, str);
      k++;
    }
  }

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => CryptoRepository())],
      child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          debugShowCheckedModeBanner: false,
          title: 'MockTradeX',
          home: const SignIn()),
    );
  }
}
