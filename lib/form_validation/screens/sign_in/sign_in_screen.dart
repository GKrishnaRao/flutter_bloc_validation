import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_validation/form_validation/screens/sign_in/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_validation/form_validation/screens/sign_in/sign_in_bloc/sign_in_event.dart';
import 'package:flutter_bloc_validation/form_validation/screens/sign_in/sign_in_bloc/sign_in_state.dart';

class SignInScreenBloc extends StatelessWidget {
  //const SignInScreenBloc({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In With Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [

            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(state.errorMessage,
                    style: const TextStyle(color: Colors.red),);
                }else{
                  return Container();
                }
              }
            ),

            const SizedBox(height: 10,),

            TextField(
              controller: emailController,
              onChanged: (val) {
                //Fire the event sign in text
                BlocProvider.of<SignInBloc>(context).add(
                  SignInTextChangeEvent(emailController.text, passwordController.text)
                );
              },
              decoration: const InputDecoration(
                hintText: "Email Address",
              ),
            ),

            const SizedBox(height: 10,),

            TextField(
              controller: passwordController,
              onChanged: (val) {
                //Fire the event
                BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangeEvent(emailController.text, passwordController.text)
                );
              },
              decoration:const InputDecoration(
                hintText: "Password"
              ),
            ),

            const SizedBox(height: 20,),

            BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if(state is SignInLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }else{
                    return CupertinoButton(
                        color: (state is SignInValidState)
                            ? Colors.blue
                            : Colors.grey,
                        onPressed: () {
                          if (state is SignInValidState) {
                            BlocProvider.of<SignInBloc>(context).add(
                                SignInSubmittedEvent(
                                    emailController.text,
                                    passwordController.text)
                            );
                          }
                        },
                        child: const Text('Sign In')
                    );
                  }
              },
            ),
          ],
        ),
      ),
    );
  }
}
