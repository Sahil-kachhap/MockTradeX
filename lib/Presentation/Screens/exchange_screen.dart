import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_tradex/Buisness_logic/Exchange/bloc/exchange_bloc.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';
import 'package:mock_tradex/Data/Repositories/crypto_repository.dart';
import 'package:mock_tradex/Presentation/Widgets/crypto_tile.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExchangeBloc(RepositoryProvider.of<CryptoRepository>(context))
            ..add(LoadApiDataEvent()),
      child: Scaffold(
          backgroundColor: Color(0xff151d27),
          body: BlocBuilder<ExchangeBloc, ExchangeState>(
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
          })),
    );
  }
}

Widget _buildCryptoTiles(List<Crypto>? cryptos) => ListView.builder(
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
    );





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