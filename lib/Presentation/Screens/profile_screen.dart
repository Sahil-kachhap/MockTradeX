import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:full_screen_menu/full_screen_menu.dart';
import 'package:mock_tradex/Presentation/Screens/about_us.dart';
import 'package:mock_tradex/Presentation/Screens/sign_in.dart';
import 'package:mock_tradex/constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String image = 'assets/dani.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBottomBarColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Profile',
                    style: kTickerTextStyle.copyWith(fontSize: 40),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onLongPress: () {
                        FullScreenMenu.show(
                          context,
                          items: [
                            GestureDetector(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                ExactAssetImage('assets/anime_avatar.png'),
                              ),
                              onTap: () {
                                setState(() {
                                  image = 'assets/anime_avatar.png';
                                  //  Navigator.pop(context);
                                });
                              },
                            ),
                            GestureDetector(
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                ExactAssetImage('assets/friends.png'),
                              ),
                              onTap: () {
                                setState(() {
                                  image = 'assets/friends.png';
                                  // Navigator.pop(context);
                                });
                              },
                            ),
                            GestureDetector(
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                ExactAssetImage('assets/dani.png'),
                              ),
                              onTap: () {
                                setState(() {
                                  image = 'assets/dani.png';
                                  // Navigator.pop(context);
                                });
                              },
                            ),
                          ],
                          backgroundColor:  Color(0xff733B3939),
                        );
                      },
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: ExactAssetImage(image),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Dani Daniels',
                    style: kTickerTextStyle.copyWith(fontSize: 30),
                  ),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                card('E mail  -  dani@gmail.com'),
                divider(),
                card('Password  -  123456'),
                divider(),
                //card('Password  123456'),
                // SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 70,
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: kTickerTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                  ),
                ),
                divider(),
                //SizedBox(height: 15,),
                card('Log Out'),
                divider(),
                // SizedBox(height: 15,),
                GestureDetector(child: card('About'),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const About()));
    },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xff444040),
      decoration: BoxDecoration(
        color: kFundTileColor,
        border: Border(
          bottom: Divider.createBorderSide(context,
              color: Colors.black, width: 1.5),
        ),
      ),
    );
  }
}

class card extends StatelessWidget {
  final String text;
  card(@required this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      decoration:
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 70,
      child: Center(
        child: Text(
          text,
          style: kTickerTextStyle.copyWith(fontSize: 15),
        ),
      ),
    );
  }
}
