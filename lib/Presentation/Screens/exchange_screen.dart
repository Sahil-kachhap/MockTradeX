import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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


        return Scaffold(
            backgroundColor: Color(0xff151d27),
            body: FutureBuilder<List<Crypto>>(
                future: CryptoRepository.getCryptoCoins(),
                builder: (context, snapshot) {
                  final cryptos = snapshot.data;

                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return _buildCryptoTiles(cryptos);
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            Lottie.asset('assets/error.json'),
                          ]));
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }));
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