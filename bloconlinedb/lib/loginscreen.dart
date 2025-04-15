import 'package:bloc22/loginevent.dart';
import 'package:bloc22/product_screen.dart';
import 'package:bloc22/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginbloc.dart';
import 'loginstate.dart';

class LoginScreen extends StatefulWidget
{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Login Page"),),
        body:Padding
          (
            padding: EdgeInsets.all(16.00),
            child: BlocConsumer<LoginBloc, LoginState>
              (
              listener: (context,state)
              {
                if (state is LoginSuccess)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProductScreen()));
                }
                else if (state is LoginFailure)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state)
              {
                if (state is LoginLoading)
                {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    TextField(
                      controller: _email,
                      decoration: const InputDecoration(labelText: "Email"),
                    ),
                    TextField(
                      controller: _pass,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password"),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(context).add(
                          LoginButtonPressedEvent(
                            email: _email.text.toString(),
                            password: _pass.text.toString(),
                          ),
                        );
                      },
                      child: const Text("Login"),
                    ),
                    TextButton(onPressed: ()
                    {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SignupScreen()));
                    }, child: Text("Do you want to signup?"))
                  ],
                );
              },
            ),
        ),
      //),
    );
  }
}
