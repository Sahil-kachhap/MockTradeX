import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_tradex/constants.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key,
  }) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBackgroundColour,
          bottom: TabBar(tabs: [
            Tab(
              child: Text(
                "Open Orders",
                style: GoogleFonts.poppins(letterSpacing: 1.0, fontSize: 18.0),
              ),
            ),
            Tab(
              child: Text(
                "Order History",
                style: GoogleFonts.poppins(letterSpacing: 1.0, fontSize: 18.0),
              ),
            ),
          ]),
        ),
        backgroundColor: kbackgroundColor,
        body: TabBarView(
          children: [
            _buildOrdersListView(),
            _buildOrderHistoryListView(),
          ],
        ),
      ),
    );
  }
}

ListView _buildOrdersListView() {
  return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          height: 180.0,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
        );
      });
}

ListView _buildOrderHistoryListView() {
  return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          height: 220.0,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    "RMRK/USDT",
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 21.0),
                  ),
                  SizedBox(
                    width: 5.2,
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.white)),
                    child: Text("Market Order",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 13.0,
                            letterSpacing: 1.0)),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Completed",
                    style: GoogleFonts.poppins(
                        fontSize: 19.0, color: Colors.white),
                  )
                ],
              ),
              Text(
                "2:14 24-02",
                style: GoogleFonts.poppins(
                    letterSpacing: 1.0, color: Colors.white),
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Amount (USDT)",
                    style: GoogleFonts.poppins(
                        fontSize: 14.0, color: Colors.white),
                  ),
                  Text(
                    "41.7601",
                    style: GoogleFonts.poppins(
                        letterSpacing: 1.0,
                        fontSize: 14.0,
                        color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order Price",
                    style: GoogleFonts.poppins(
                        fontSize: 14.0, color: Colors.white),
                  ),
                  Text(
                    "- -",
                    style: GoogleFonts.poppins(
                        fontSize: 14.0, color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Stop Price",
                    style: GoogleFonts.poppins(
                        fontSize: 14.0, color: Colors.white),
                  ),
                  Text(
                    "- -",
                    style: GoogleFonts.poppins(
                        fontSize: 14.0, color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Avg. Price",
                    style: GoogleFonts.poppins(
                        fontSize: 14.0, color: Colors.white),
                  ),
                  Text(
                    "22.2998",
                    style: GoogleFonts.poppins(
                        letterSpacing: 1.0,
                        fontSize: 14.0,
                        color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filled",
                    style: GoogleFonts.poppins(
                        fontSize: 14.0, color: Colors.white),
                  ),
                  Text(
                    "41.76",
                    style: GoogleFonts.poppins(
                        letterSpacing: 1.0,
                        fontSize: 14.0,
                        color: Colors.white),
                  )
                ],
              )
            ]),
          ),
        );
      });
}
