import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../sign_in/sign_in_bloc/sign_in_bloc.dart';
import '../sign_in/sign_in_screen.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Flutter Bloc',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 50,),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: CupertinoButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider(
                          create: (context) => SignInBloc(),
                            child: SignInScreenBloc(),
                        )));
                      },
                      color: Colors.blue,
                      child: const Text('Sign In With Email'),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: CupertinoButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreenBloc()));
                      },
                      color: Colors.blue,
                      child: const Text('Sign In With Google'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
