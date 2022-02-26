import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Screens/exchange_screen.dart';
import 'package:mock_tradex/Presentation/Screens/sign_up.dart';
import 'package:mock_tradex/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  late String email;
  late String password;
  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Container(
              margin: EdgeInsets.only(top: 70),

              //padding: EdgeInsets.only(left: 50),
             height: 250,
             width: 400,
             // child: Text('Login',style: kTickerTextStyle.copyWith(fontSize: 24),),
              child:Image.asset("assets/images signin.png"),
            ),
            Container(
              margin: EdgeInsets.only(left: 35),
            child: Text('Login',style: kTickerTextStyle.copyWith(fontSize: 25),),
            ),
            Container(
              margin: EdgeInsets.only(left: 35,top: 10),
              child: Text('Please Sign in to continue',style: kTickerSubTextStyle.copyWith(fontSize: 15, ),),
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
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                 // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                  labelText: 'E-mail',
                  hintText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    hintStyle: TextStyle(color: Colors.blueAccent)
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 35,right: 35,top: 10),

              margin: EdgeInsets.only(top: 10),
              child: TextField(
                onChanged: (value){
                  password=value;

                },
              style: TextStyle(

                color: Colors.blueAccent
              ),

                //scrollPadding: EdgeInsets.all(50),
                obscureText: true,
                decoration: InputDecoration(

                  // disabledBorder: ,
                  fillColor: Color(0xff363144),
                  hoverColor: Colors.white,

               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.blueAccent),
                  hintText: 'Password',
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
                   onPressed: () async{
                     try {
                       final user = await _auth.signInWithEmailAndPassword(
                           email: email, password: password);
                       if(user!=null){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => ExchangeScreen()));
                       }else{

                       }
                     }
                     catch(e){

                     }
                     },
                   child: Text('Log In',style: kTickerTextStyle),),
                 ),

             ],
           ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
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
                    onPressed: () async{
                      _auth.signOut();
                    },
                    child: Text('Log Out',style: kTickerTextStyle),),
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
                  Text('Do not have a account? ',style: kTickerTextStyle,),
                  GestureDetector(child: Text('Sign up',style: kTickerTextStyle.copyWith(color: Colors.blueAccent),),
                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
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
