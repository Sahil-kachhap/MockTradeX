import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Screens/exchange_screen.dart';
import 'package:mock_tradex/Presentation/Widgets/search_bar.dart';
import 'package:mock_tradex/constants.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
class Quickbuy extends StatefulWidget {
  const Quickbuy({Key? key}) : super(key: key);

  @override
  _QuickbuyState createState() => _QuickbuyState();
}

class _QuickbuyState extends State<Quickbuy> {
  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;


    return Scaffold(
     backgroundColor: Color(0xff1a202c),
      body: Column(

        children: [
          SizedBox(height: 54, child:
              Scaffold(
                   //backgroundColor: Color(0xff1a202c),
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
                ),
              )
          ),
          SizedBox(height: 50,child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Container(
                  color: kBottomBarColor,
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Expanded(child:  Container()),
                        const TabBar(
                          tabs: [ Text('WatchList 1',style: TextStyle(
                            height: 2,

                          ),),


                            Text('Watchlist 2',
                              style: TextStyle(
                                height: 2,

                              ),)],
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ),
          ),),



      ]
      )
      );



  }
}
