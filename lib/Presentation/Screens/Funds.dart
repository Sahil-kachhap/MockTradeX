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
      backgroundColor: Color(0xff2B3242),

      body: Column(

        children: [
          Container(
            padding: EdgeInsets.only(bottom: 50,top: 10,left: 10),
            height: 138,
            child: Column(
              children: [
                Row(

                  children: [

                    Icon(Icons.animation,
                      color: Color(0xffF0F1F4),
                    size: 25,),
                     SizedBox(
                       width: 15,
                     ),
                    Text('Total Assets in INR'
                    ,style: TextStyle(color: Color(0xffF0F1F4),
                      fontSize: 20),),
                    SizedBox(width: 80),
                    Text('2300.00',style: TextStyle(color: Color(0xffF0F1F4),
                        fontSize: 20))
                  ],
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff3C4353),
                    onPrimary: Colors.white,
                    shadowColor: Colors.white,
                    //elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: Size(150, 40), //////// HERE
                  ),
                  onPressed: () {

                    setState(() {
                      x=x+20;
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
          Expanded(
            child: Container(
             
              child: Card(
                color: Color(0xff191D28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                  )
                ),
                child: Column(

                  children: [

                    Container(
                      height: 150,
                      child: Card(

                       margin: EdgeInsets.only(top: 18,left: 18,right: 18,bottom: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Color(0xff09B198),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                x.toString(),style: TextStyle(
                                  fontSize: 40.0,
                                color: Color(0xffF0F1F4)
                                ),),

                              const Text(
                                'TOTAL PORTFOLIO VALUE',style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xffF0F1F4)
                              ),),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                    bottom: Divider.createBorderSide(context, color:Colors.white60, width: 0.5),
                                            ),
                                        ),
                              )

                            ],
                          ),
                        ),
                      ),

                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: ListView(

                          children: [
                            SizedBox(
                              height:100,

                              child: Card(
                                color: Color(0xff262C38),
                                shadowColor: Color(0xff262C38),

                              ),
                            ),
                            SizedBox(
                              height:100,

                              child: Card(
                                color: Color(0xff262C38),
                                shadowColor: Color(0xff262C38),

                              ),
                            ),
                            SizedBox(
                              height:100,

                              child: Card(
                                color: Color(0xff262C38),
                                shadowColor: Color(0xff262C38),

                              ),
                            ),
                            SizedBox(
                              height:100,

                              child: Card(
                                color: Color(0xff262C38),
                                shadowColor: Color(0xff262C38),
                                //conatins item of card
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Row(

                                          children: [
                                            Icon(Icons.ac_unit_sharp,
                                            size: 15,
                                            color: Colors.white,),
                                            SizedBox(
                                              width: 10,),
                                            Text('BIT COIN',style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,

                                            ),)
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 2,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('Total',style: TextStyle(color: Colors.white,fontSize: 15),),
                                          Text('Available',style: TextStyle(color: Colors.white,fontSize: 15),),
                                          Text('In Orders',style: TextStyle(color: Colors.white,fontSize: 15),),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('0.0001',style: TextStyle(color: Colors.white,fontSize: 15),),
                                          Text('0.0002',style: TextStyle(color: Colors.white,fontSize: 15),),
                                          Text('0.0003',style: TextStyle(color: Colors.white,fontSize: 15),),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ),
                            ), SizedBox(
                              height:100,

                              child: Card(
                                color: Color(0xff262C38),
                                shadowColor: Color(0xff262C38),

                              ),
                            )
                          ],
                        )
                      ),
                    )


                  ],

                ),
              ),
            ),


          ),
        ],
      ),
    );
  }
}
