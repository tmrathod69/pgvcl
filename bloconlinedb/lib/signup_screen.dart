import 'package:bloc22/loginscreen.dart';
import 'package:bloc22/signup_bloc.dart';
import 'package:bloc22/signup_event.dart';
import 'package:bloc22/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignupScreen extends StatelessWidget
{
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Signup")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<SignupBloc, SignupState>(
            listener: (context, state)
            {
              if (state is SignupSuccess) {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );

                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen()));

              } else if (state is SignupFailure)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state)
            {
              if (state is SignupLoading)
              {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<SignupBloc>(context).add(
                        SignupButtonPressed(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    child: const Text("Signup"),
                  ),
                  TextButton(onPressed: ()
                  {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen()));

                  }, child: Text("Already have an account?"))
                ],
              );
            },
          ),
        ),
      );
  }
}
