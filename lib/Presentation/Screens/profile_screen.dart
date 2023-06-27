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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(image),
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
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Profile',
                    style: kTickerTextStyle.copyWith(fontSize: 40),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onLongPress: () {
                        FullScreenMenu.show(
                          context,
                          items: [
                            GestureDetector(
                              child: const CircleAvatar(
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
                          backgroundColor: const Color(0xff733b3939),
                        );
                      },
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: ExactAssetImage(image),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Dani Daniels',
                    style: kTickerTextStyle.copyWith(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                const card('E mail  -  dani@gmail.com'),
                const divider(),
                const card('Password  -  123456'),
                const divider(),
                //card('Password  123456'),
                // SizedBox(height: 15,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignIn()));
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
                const divider(),
                //SizedBox(height: 15,),
                const card('Log Out'),
                const divider(),
                // SizedBox(height: 15,),
                GestureDetector(
                  child: const card('About'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const About()));
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
  const divider({super.key});

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
  const card(@required this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      decoration:
          const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
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
