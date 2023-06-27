
import 'package:flutter/material.dart';
import 'package:mock_tradex/constants.dart';
class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
          children: [
            Container(

              decoration: const BoxDecoration(
                color: Colors.transparent,

                image: DecorationImage(
                  fit: BoxFit.cover,

                 // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: AssetImage(
                    'assets/block.jpg',
                  ),
                ),
              ),

              height: double.infinity,
              width: double.infinity,
            ),

            Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
           children: [

                Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: Text('About Us',style: kTickerTextStyle.copyWith(
                      fontSize: 55
                    ),),
                ),
             const SizedBox(
               height: 50,
             ),
             Container(
               padding: const EdgeInsets.only(left: 15,right: 10),
               child: Text('Mock Trade X is a Software Application that helps you keep track'
                   ' of your crypto investment without actually spending your money in the market.'
                   ,
               style: kTickerTextStyle.copyWith(fontSize: 17),)
               ,
             ),
             Container(
               padding: const EdgeInsets.only(left: 15,right: 10),
               child: Text(
                   'You can improve your tactics for the market without spending your actual money.'
                   ' It provides you a way to spend virtual money in the market and track your gains.',
                 style: kTickerTextStyle.copyWith(fontSize: 17),)
               ,
             ),
             const SizedBox(
               height: 30,
             ),
             Container(

              // padding: EdgeInsets.only(left: 10,right: 10),
               child: Text(
                 'Our Team',
                 style: kTickerTextStyle.copyWith(fontSize: 30),)
               ,
             ),
             const SizedBox(
               height: 20,
             ),
             Container(

               // padding: EdgeInsets.only(left: 10,right: 10),
               child: Column(
                 children: [
                   Text(
                     'Tryambkesh Kumar',
                     style: kTickerTextStyle.copyWith(fontSize: 20),),
                   Text(
                     'Sahil Kumar Raj',
                     style: kTickerTextStyle.copyWith(fontSize: 20),),
                   Text(
                     'Sahil Kachhap',
                     style: kTickerTextStyle.copyWith(fontSize: 20),),
                 ],
               )
               ,
             ),

             const SizedBox(
               height: 20,
             ),
             Container(
               padding: const EdgeInsets.only(left: 10,right: 10),
               child: Text('If you are facing any problem or want to give any feedback, feel free to e mail us.',style: kTickerTextStyle.copyWith(
                 fontSize: 17
               ),),
             ),
             Container(
               padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
               child: Text('snowproject0@gmail.com',style: kTickerTextStyle.copyWith(
                   fontSize: 20
               ),),
             )
              ],
            )
          ],
        ),
    );

  }
}
