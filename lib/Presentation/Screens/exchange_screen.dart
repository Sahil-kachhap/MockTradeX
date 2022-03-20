import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_tradex/Buisness_logic/exchange/exchange_bloc.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';
import 'package:mock_tradex/Data/Repositories/crypto_repository.dart';
import 'package:mock_tradex/Presentation/Widgets/crypto_tile.dart';
import 'package:mock_tradex/Presentation/Widgets/search_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../constants.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: 2,);
  }

  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) =>
          ExchangeBloc(RepositoryProvider.of<CryptoRepository>(context))
            ..add(LoadApiDataEvent()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff080c10),
            title: Text('Exchange'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  showSearch(context: context, delegate: SearchUser());
                },
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 30),
              child: Container(
                child: TabBar(
                  labelPadding: EdgeInsets.all(0),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Color(0xff125fcb),
                  indicatorWeight: 4,
                  controller: tabController,
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Tab(
                        text: ('USD'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Tab(
                        text: ('BTC'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: Color(0xff080c10),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Text(
                        'Market / Vol',
                        style: kTickerTextStyle.copyWith(
                            fontSize: 11,
                            color: kExchangeScreenSortTileTextColor),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Price        ',
                            style: kTickerTextStyle.copyWith(
                                fontSize: 11,
                                color: kExchangeScreenSortTileTextColor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Change',
                        style: kTickerTextStyle.copyWith(
                            fontSize: 11,
                            color: kExchangeScreenSortTileTextColor),
                      ),
                    ),
                  ],
                ),
                height: 36,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xff0a1628),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5),
                    )),
              ),
              Expanded(
                child: BlocBuilder<ExchangeBloc, ExchangeState>(
                    builder: (context, state) {
                  if (state is ExchangeInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is DataLoadedState) {
                    return _buildCryptoTiles(state.crypto);
                  }

                  if (state is DataErrorState) {
                    return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Lottie.asset('assets/error.json'),
                        ]));
                  }
                  return Container();
                }),
              ),
            ],
          )),
    );
  }
}

Widget _buildCryptoTiles(List<Crypto>? cryptos) {
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  // necessary hai ye?
  // @override
  // void dispose() {
  //   _refreshController.dispose();
  // }


  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  // void _onLoading() async{
  //   // monitor network fetch
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   // if failed,use loadFailed(),if no data return,use LoadNodata()
  //   _refreshController.loadComplete();
  // }



  return SmartRefresher(
    enablePullDown: true,
    controller: _refreshController,
    header: MaterialClassicHeader(
      color: Color(0xff056cf3),
      backgroundColor: Color(0xff0a1628),
    ),
    onRefresh: _onRefresh,
    //onLoading: _onLoading,

    child: ListView.builder(
      itemCount: cryptos!.length,
      itemBuilder: (context, index) {
        final coin = cryptos[index];

        return CryptoTile(
          cryptoName: coin.name,
          cryptoSymbol: coin.symbol!.toUpperCase(),
          currentPrice: coin.currentPrice.toString(),
          priceChange: coin.priceChangePercentage24h,
          imageUrl: coin.image,
          index: index,
          // low_24h: coin.low_24h,
          //  high_24h: coin.high_24h,
          // totalVolume: coin.totalVolume,
        );
      },
    ),
  );
}

/*
ListView.builder(
            itemCount: crypto.length,
            itemBuilder: (BuildContext context, int index) {
              return CryptoTile(
                cryptoName: crypto[index].name,
                cryptoSymbol: crypto[index].symbol,
                currentPrice: crypto[index].currentPrice.toString(),
                priceChange: crypto[index].priceChangePercentage24h.toString(),
                imageUrl: crypto[index].image,
              );
            }));
  }

*/
