import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mock_tradex/constants.dart';

class Funds extends StatefulWidget {
  const Funds({Key? key}) : super(key: key);

  @override
  _FundsState createState() => _FundsState();
}

class _FundsState extends State<Funds> {
  int x=1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kbackgroundColor,

      body: Column(

        children: [
          Container(
              padding: EdgeInsets.only(top: 10,left: 10),
              height: 138,
              child: Column(
                children: [
                  Expanded(
                    child: Row(

                      children: [

                        Container(
                          child: Icon(
                            Icons.animation,
                            size: 20.0,
                            color: kBottomBarTextActive,
                            
                          ),
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.fromLTRB(0, 5.0, 0, 0.0),
                          decoration: BoxDecoration(
                            color: kFundTileColor,
                            borderRadius: BorderRadius.all(Radius.circular(100.0)),
                          ),
                        ),
                         SizedBox(
                           width: 15,
                         ),
                        Text('Total Assets in INR'
                        ,style: kTickerTextStyle),
                        SizedBox(width: 100),
                        Text('2300.00',style: kTickerTextStyle)
                      ],
                    ),
                  ),
                    SizedBox(
                      height: 20,
                    ),
                //  Color(0xff3C4353),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      //onPrimary: Colors.white,
                     // shadowColor: Colors.white,
                      //elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize: Size(150, 40), //////// HERE
                    ),
                    onPressed: () {

                      setState(() {
                        x=x+20;
                        //Navigator.push(context, MaterialPageRoute(builder: ))
                      });
                    },
                    child: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Icon(Icons.assignment_returned_outlined,
                          color: Colors.white,
                          size: 20,),
                          SizedBox(width: 5,),
                          Text('Deposit'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              //color: Color(0xff1A1E29),
            ),
          Container(

             margin: EdgeInsets.only(top: 18,left: 18,right: 18,bottom: 30),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),

             child: Center(
               child: Column(

                 children: [

                   Text(
                     x.toString(),style: TextStyle(
                       fontSize: 25.0,
                       color: Color(0xffF0F1F4)
                   ),),

                   Text(

                     'TOTAL PORTFOLIO VALUE',style: kTickerTextStyle),
                   SizedBox(
                     height: 10,
                   ),
                   Container(
                     decoration: BoxDecoration(
                       border: Border(
                         bottom: Divider.createBorderSide(context, color:Colors.blue, width: 0.5),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 15,
                   )

                 ],
               ),
             ),
           ),
            //  color: Color(0xff191D28),
         Container(
           padding: EdgeInsets.only(left: 25,right: 25),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text('Assests',style: kTickerTextStyle,),
               Text('Prices',style: kTickerTextStyle,),
               Text('Holdings',style: kTickerTextStyle,),
             ],
           ),
         ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
             decoration: BoxDecoration(
               color: kbackgroundColor,
               borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
             ),

             //padding: EdgeInsets.only(left: 5,right: 5),
              child:ListView(
                   children: [

                   Container(
             height: 80,

               child:Text('Bitcoin'),
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color: kFundTileColor,

                       border: Border(
                         bottom: Divider.createBorderSide(context, color:Colors.black, width: 1.5),
                       ),
                     ),
             ),


               Container(
               height: 80,

               child:Text('Bitcoin'),
                 width: double.infinity,
                 decoration: BoxDecoration(
                   //color: Color(0xff191D28),
                   color: kFundTileColor,
                   border: Border(
                     bottom: Divider.createBorderSide(context, color:Colors.black, width: 1.5),
                   ),
                 ),
               ),
               Container(
               height: 80,
               //color: Color(0xff191D28),
                    child:Text('Bitcoin'),
                 width: double.infinity,
                 decoration: BoxDecoration(
                  // color: Color(0xff191D28),
                   color:kFundTileColor,
                   border: Border(
                     bottom: Divider.createBorderSide(context, color:Colors.black, width: 1.5),
                   ),
                 ),
                   ),
    Container(
    height: 80,
   // color: Color(0xff191D28),
    child:Text('Bitcoin'),
      width: double.infinity,
      decoration: BoxDecoration(
       // color: Color(0xff191D28),
        color: kFundTileColor,
        border: Border(
            bottom: Divider.createBorderSide(context, color:Colors.black, width: 1.5),
        ),
      ),
    ),
    Container(
    height: 80,
    //color: Color(0xff191D28),
    child:Text('Bitcoin'),
      width: double.infinity,
      decoration: BoxDecoration(
       // color: Color(0xff191D28),
        color: kFundTileColor,
        border: Border(
            bottom: Divider.createBorderSide(context, color:Colors.black, width: 1.5),
        ),
      ),
    )
             ],
             )
            ),
          ),
        ],
      ),
    );
  }
}
