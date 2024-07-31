import 'package:flutter/material.dart';
import 'package:flutter_app/components/button.dart';
import 'package:flutter_app/components/input.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          titleTextStyle:
              TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
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
              const Button(title: 'Login'),
            ],
          ),
        ),
      ),
    );
  }
}
