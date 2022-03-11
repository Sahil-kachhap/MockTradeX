

import 'package:flutter/material.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';
import 'package:mock_tradex/main.dart';
import 'package:mock_tradex/Presentation/Widgets/crypto_tile.dart';
import 'package:mock_tradex/Presentation/Widgets/search_bar.dart';
import 'package:mock_tradex/constants.dart';

import '../../functions.dart';



//late final List<String> n;

class Quickbuy extends StatefulWidget {
  const Quickbuy({Key? key}) : super(key: key);

  @override
  _QuickbuyState createState() => _QuickbuyState();
}

class _QuickbuyState extends State<Quickbuy> {
  //final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;



    return DefaultTabController(
      length: 1,
      child: Scaffold(
          backgroundColor: Color(0xff1a202c),
          appBar: AppBar(

              backgroundColor: kBottomBarColor,
              title: Text('Search and Add'),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){
                    showSearch(context: context, delegate: SearchUser());
                  },
                )
              ],

              bottom: PreferredSize(
                  preferredSize: Size(50.0, 50.0),
                  child: TabBar(
                      indicatorColor: kBottomBarTextActive,
                      //indicatorSize: TabBarIndicatorSize.label,
                      tabs:  [ Text('WatchList',style: TextStyle(
                        height: 4,
                        fontWeight: FontWeight.bold

                      ),),



                      ]))),
          body: TabBarView(
            children: [

              ListView.builder(
                itemCount: n!.length,
                itemBuilder: (context, index) {

                  return CryptoTile(
                    cryptoName: n?[index],
                    cryptoSymbol: sy?[index],
                    currentPrice: price?[index],
                    priceChange: pr?[index],
                    imageUrl: image?[index],
                    index: index,
                    // low_24h: coin.low_24h,
                    //  high_24h: coin.high_24h,
                    // totalVolume: coin.totalVolume,


                  );
                },
              )

            ],
          )


      ),
    );


  }
}







