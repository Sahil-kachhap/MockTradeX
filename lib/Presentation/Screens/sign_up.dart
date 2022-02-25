import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Screens/sign_in.dart';
import 'package:mock_tradex/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  late String email;
  late String name;
  late String password;
  late String confirm;
  final _auth=FirebaseAuth.instance;



  @override


  Widget build(BuildContext context) {
    return Scaffold(

         backgroundColor: Color(0xff1F1A30),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100,left: 35),
              child:Text('Create Account',style: kTickerTextStyle.copyWith(fontSize: 35),)
            ),
            Container(
              margin: EdgeInsets.only(left: 35,top: 5),
              child: Text('Please fill the input below',style: kTickerSubTextStyle),
            ),

            SizedBox(
              height: 10,
            ),
            Container(

              padding: EdgeInsets.only(left: 35,right: 35,top: 10),

              margin: EdgeInsets.only(top: 10),
              child: TextField(
                onChanged: (value){
                  name=value;
                },

                style: TextStyle(color: Colors.blueAccent),
                //scrollPadding: EdgeInsets.all(50),

                decoration: InputDecoration(
                  // disabledBorder: ,

                    fillColor: Color(0xff363144),
                    hoverColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20)),
                    // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                    labelText: 'Name',

                    hintText: 'Name',
                    labelStyle: TextStyle(color: Colors.blueAccent,
                    ),
                    hintStyle: TextStyle(color: Colors.blueAccent)
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Container(

              padding: EdgeInsets.only(left: 35,right: 35,top: 10),

              margin: EdgeInsets.only(top: 10),
              child: TextField(
                onChanged: (value){
                  email=value;
                },
                style: TextStyle(color: Colors.blueAccent),
                //scrollPadding: EdgeInsets.all(50),

                decoration: InputDecoration(
                  // disabledBorder: ,

                    fillColor: Color(0xff363144),
                    hoverColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20)),
                    // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                    labelText: 'E-mail',

                    hintText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.blueAccent,
                    ),
                    hintStyle: TextStyle(color: Colors.blueAccent)
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(

              padding: EdgeInsets.only(left: 35,right: 35,top: 10),

              margin: EdgeInsets.only(top: 10),
              child: TextField(

                onChanged: (value){
                    password=value;
                },

                obscureText: true,
                style: TextStyle(color: Colors.blueAccent),
                //scrollPadding: EdgeInsets.all(50),

                decoration: InputDecoration(
                  // disabledBorder: ,

                    fillColor: Color(0xff363144),
                    hoverColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20)),
                    // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                    labelText: 'Password',

                    hintText: 'Password',
                    labelStyle: TextStyle(color: Colors.blueAccent,
                    ),
                    hintStyle: TextStyle(color: Colors.blueAccent)
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Container(

              padding: EdgeInsets.only(left: 35,right: 35,top: 10),

              margin: EdgeInsets.only(top: 10),
              child: TextField(
                onChanged: (value){
                    confirm=value;
                },

                obscureText: true,

                style: TextStyle(color: Colors.blueAccent),
                //scrollPadding: EdgeInsets.all(50),

                decoration: InputDecoration(
                  // disabledBorder: ,

                    fillColor: Color(0xff363144),
                    hoverColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20)),
                    // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                    labelText: 'Confirm Password',

                    hintText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.blueAccent,
                    ),
                    hintStyle: TextStyle(color: Colors.blueAccent)
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  //color: Colors.blueAccent,
                  height: 60,
                  width: 120,
                  child: TextButton(

                    style: ButtonStyle(
                      // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                        // foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),

                            )
                        )
                    ),
                    onPressed: () async {
                      try {
                        final user = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if(user!=null){
                         Navigator.pop(context);
                        }
                      }
                      catch(e){

                      }
                    },
                    child: Text('Sign Up',style: kTickerTextStyle),),
                ),

              ],
            ),
            SizedBox(
              height: 80,
            ),

            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have a account? ',style: kTickerTextStyle,),
                  GestureDetector(child: Text('Log In',style: kTickerTextStyle.copyWith(color: Colors.blueAccent),),
                    onTap: (){
                     Navigator.pop(context);
                    },)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
