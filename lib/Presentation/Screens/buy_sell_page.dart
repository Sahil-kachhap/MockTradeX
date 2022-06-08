import 'package:flutter/material.dart';
import 'package:mock_tradex/constants.dart';
import 'trade_screen.dart';

// class BuySellPage extends StatefulWidget {
//   final String? orderside;
//   const BuySellPage({
//     Key? key,
//     this.orderside,
//   }) : super(key: key);
//
//   @override
//   _BuySellPageState createState() => _BuySellPageState();
// }
//
// class _BuySellPageState extends State<BuySellPage>
//   {
//   TabController? tabController;
//   int? activeIndex;
//   @override
//   void initState() {
//     super.initState();
//     // tabController = TabController(
//     //   vsync: this,
//     //   length: 2,
//     //  // animationDuration: Duration(milliseconds: 500),
//     // );
//     // if (widget.pageTitle == "BUY") {
//     //   tabController!.index = 0;
//     //   activeIndex=0;
//     // } else {
//     //   tabController!.index = 1;
//     //   activeIndex=1;
//     // }
//     // tabController!.animation!.addListener(_setActiveTabIndex);
//   }
//
//   // void _setActiveTabIndex() {
//   //
//   //   if (tabController!.indexIsChanging) {
//   //     Future.delayed(Duration(milliseconds: 250), () {
//   //       setState(() {
//   //         activeIndex = tabController!.index;
//   //       });
//   //     });
//   //   }
//   //   else if(tabController!.animation!.value.round()!=tabController!.index)
//   //     {   print(tabController!.animation!.value);
//   //       setState(() {
//   //         activeIndex = tabController!.animation!.value.round();
//   //       });
//   //     }
//   // }
//
//   @override
//   void dispose() {
//     tabController?.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black54,
//         elevation: 0,
//         titleSpacing: 2,
//         centerTitle: true,
//         title: Text('Spot ${widget.orderside}'),
//
//         // bottom: TabBar(
//         //   indicatorSize: TabBarIndicatorSize.label,
//         //   indicatorColor: (activeIndex == 0) ? Color(0xff286bdb) : Color(0xffdb3c0f),
//         //   controller: tabController,
//         //   tabs: const [
//         //     Padding(
//         //       padding: EdgeInsets.symmetric(horizontal: 15),
//         //       child: Tab(
//         //         text: ('BUY'),
//         //       ),
//         //     ),
//         //     Padding(
//         //       padding: EdgeInsets.symmetric(horizontal: 15.0),
//         //       child: Tab(
//         //         text: ('SELL'),
//         //       ),
//         //     ),
//         //   ],
//         // ),
//       ),
//       backgroundColor: Colors.black54,
//       body: OrderPage(
//         orderSide: widget.orderside,
//         ),
//       // body: TabBarView(
//       //   controller: tabController,
//       //   children: [
//       //     OrderPage(
//       //       orderSide: 'BUY',
//       //         pageThemeColor: Color(0xff286bdb) ,
//       //     ),
//       //     OrderPage(
//       //       orderSide: 'SELL',
//       //     pageThemeColor:
//       //     Color(0xffef4006),
//       //     ),
//       //],
//     );
//   }
// }
