import 'package:flutter/material.dart';
import 'package:mock_tradex/main.dart';
import 'package:mock_tradex/Presentation/Widgets/crypto_tile.dart';
import 'package:mock_tradex/Presentation/Widgets/search_bar.dart';
import 'package:mock_tradex/constants.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    void _onRefresh() async {
      // monitor network fetch
      await Future.delayed(const Duration(milliseconds: 1000));
      // if failed,use refreshFailed()
      _refreshController.refreshCompleted();
    }



    return DefaultTabController(
      length: 1,
      child: Scaffold(
          backgroundColor: const Color(0xff1a202c),
          appBar: AppBar(
              backgroundColor: Colors.black,

              title: Text('Favourites'),



              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: SearchUser());
                  },
                )
              ],

             ),



          body: TabBarView(
            children: [
              SmartRefresher(

                enablePullDown: true,
                controller: _refreshController,
                header: MaterialClassicHeader(
                  color: Color(0xff056cf3),
                  backgroundColor: Color(0xff0a1628),
                ),
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: n!.length,
                  itemBuilder: (context, index) {

                    return CryptoTile(
                      cryptoName: n?[index],
                      cryptoSymbol: sy?[index],
                      currentPrice: price?[index],
                      priceChange: pr?[index],
                     // imageUrl: image?[index],
                      index: index,
                     // low_24h: coin.low_24h,
                      //  high_24h: coin.high_24h,
                      // totalVolume: coin.totalVolume,


                    );
                  },
                )

              ),

            ],
          )),
    );
  }
}
