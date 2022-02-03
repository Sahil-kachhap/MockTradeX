import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';
import 'package:mock_tradex/Data/Repositories/crypto_repository.dart';
import 'package:mock_tradex/Data/Repositories/search_repository.dart';
import 'crypto_tile.dart';
class SearchUser extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.close),
      onPressed: (){
        query="";
      },
    )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },);
  }

  @override
  Widget buildResults(BuildContext context) {

    return Container(
      child: FutureBuilder<List<Crypto>>(
        //changed
          future: SearchRepository.getCryptoSearch(query: query),
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
          }),
    );
  }
  Widget _buildCryptoTiles(List<Crypto>? cryptos) => ListView.builder(
    itemCount: cryptos!.length,
    itemBuilder: (context, index) {
      final coin = cryptos[index];

      return
         Column(
           children: [
             CryptoTile(
                cryptoName: coin.name,
                cryptoSymbol: coin.symbol,
                currentPrice: coin.currentPrice.toString(),
                priceChange: coin.priceChangePercentage24h,
                imageUrl: coin.image,
                index: index,
               icon:
               IconButton(icon: Icon(Icons.add_box_sharp,
               color: Colors.amber,),
                 onPressed: (){
                       Navigator.pop(context);
                 },),
              ),
           ],

         );


    },
  );


  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Crypto>>(
        future: SearchRepository.getCryptoSearch(query: query),
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
              color: Colors.black,
            ),
          );
        });
  }

}

