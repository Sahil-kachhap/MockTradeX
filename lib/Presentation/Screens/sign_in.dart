import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_tradex/Buisness_logic/auth/bloc/auth_bloc.dart';
import 'package:mock_tradex/Data/Repositories/auth_repository.dart';
import 'package:mock_tradex/Presentation/Screens/front_page.dart';
import 'package:mock_tradex/Presentation/Screens/sign_up.dart';
import 'package:mock_tradex/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Frontpage()));
            }

            if (state is AuthError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.Error)));
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UnAuthenticated) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      //padding: EdgeInsets.only(left: 50),
                      height: 250,
                      width: 400,
                      // child: Text('Login',style: kTickerTextStyle.copyWith(fontSize: 24),),
                      child: Image.asset("assets/images signin.png"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 35),
                      child: Text(
                        'Login',
                        style: kTickerTextStyle.copyWith(fontSize: 25),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 35, top: 10),
                      child: Text(
                        'Please Sign in to continue',
                        style: kTickerSubTextStyle.copyWith(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 35, right: 35, top: 10),
                      margin: const EdgeInsets.only(top: 10),
                      child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        style: const TextStyle(color: Colors.blueAccent),
                        //scrollPadding: EdgeInsets.all(50),

                        decoration: const InputDecoration(
                            // disabledBorder: ,
                            fillColor: Color(0xff363144),
                            hoverColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueAccent)),
                            // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                            labelText: 'E-mail',
                            hintText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.blueAccent),
                            hintStyle: TextStyle(color: Colors.blueAccent)),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 35, right: 35, top: 10),
                      margin: const EdgeInsets.only(top: 10),
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        style: const TextStyle(color: Colors.blueAccent),

                        //scrollPadding: EdgeInsets.all(50),
                        obscureText: true,
                        decoration: const InputDecoration(

                            // disabledBorder: ,
                            fillColor: Color(0xff363144),
                            hoverColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueAccent)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.blueAccent),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.blueAccent)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          //color: Colors.blueAccent,
                          height: 60,
                          width: 120,
                          child: TextButton(
                            style: ButtonStyle(
                                // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blueAccent),
                                // foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ))),
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(SignInRequested(email, password));
                            },
                            child:
                                const Text('Log In', style: kTickerTextStyle),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          //color: Colors.blueAccent,
                          height: 60,
                          width: 120,
                          child: TextButton(
                            style: ButtonStyle(
                                // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blueAccent),
                                // foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ))),
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(SignOutRequested());
                            },
                            child:
                                const Text('Log Out', style: kTickerTextStyle),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Do not have a account? ',
                          style: kTickerTextStyle,
                        ),
                        GestureDetector(
                          child: Text(
                            'Sign up',
                            style: kTickerTextStyle.copyWith(
                                color: Colors.blueAccent),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                        )
                      ],
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
