import 'package:flutter/material.dart';

import 'package:flutter_app/components/button.dart';
import 'package:flutter_app/components/input.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          titleTextStyle:
              TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50),
                Icon(
                  Icons.message,
                  size: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Let\'s create account for you',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Input(
                  label: 'Email',
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                Input(
                  label: 'Password',
                  obscureText: true,
                  hintText: 'Password',
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                Input(
                  label: 'Confirm Password',
                  obscureText: true,
                  hintText: 'Confirm Password',
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                const Button(title: 'Register'),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Login now',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
