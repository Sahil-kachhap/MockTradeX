import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Widgets/search_bar.dart';
import 'package:mock_tradex/constants.dart';
import 'package:mock_tradex/main.dart';

class Quickbuy extends StatefulWidget {
  const Quickbuy({Key? key}) : super(key: key);

  @override
  _QuickbuyState createState() => _QuickbuyState();
}

class _QuickbuyState extends State<Quickbuy> {
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Color(0xff1a202c),
          appBar: AppBar(
              backgroundColor: kBottomBarColor,
              title: Text('Search and Add'),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: SearchUser());
                  },
                )
              ],
              bottom: PreferredSize(
                  preferredSize: Size(50.0, 50.0),
                  child: TabBar(
                      indicatorColor: kBottomBarTextActive,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Text(
                          'WatchList 1',
                          style: TextStyle(
                            height: 2,
                          ),
                        ),
                        Text(
                          'WatchList 1',
                          style: TextStyle(
                            height: 2,
                          ),
                        ),
                      ]))),
          body: TabBarView(
            children: [
              ListView.builder(
                //shrinkWrap: true,
                itemCount: l!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          l![index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            left: Divider.createBorderSide(context,
                                color: Colors.black, width: 1.5),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              ListView.builder(
                // shrinkWrap:true,
                itemCount: l1!.length,

                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          l1![index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            left: Divider.createBorderSide(context,
                                color: Colors.black, width: 1.5),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          )),
    );
  }
}
