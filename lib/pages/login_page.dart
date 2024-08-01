import 'package:flutter/material.dart';

import 'package:flutter_app/components/button.dart';
import 'package:flutter_app/components/input.dart';
import 'package:flutter_app/modal/auth_modal.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/services/auth_service.dart';
import 'package:localstorage/localstorage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final authServices = AuthService();
  var errors = {
    'email': '',
    'password': '',
  };

  void login(BuildContext context) async {
    setState(() {
      errors = {
        'email': '',
        'password': '',
      };
    });
    final loginData = LoginData(
        email: _emailController.text, password: _passwordController.text);
    try {
      dynamic loginResponse = await authServices.login(loginData);
      if (loginResponse['status'] == 1) {
        localStorage.setItem('token', loginResponse['access_token'] ?? '');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        if (loginResponse['message'] is String) {
          setState(() {
            errors = {
              'email': loginResponse['message'],
              'password': loginResponse['message'],
            };
          });
          return;
        }
        setState(() {
          errors = {
            'email': loginResponse['message']?['mail_address']?[0] ?? '',
            'password': loginResponse['message']?['password']?[0] ?? '',
          };
        });
      }
    } catch (e) {
      print('e: $e');
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Some thing went wrong !'),
        ),
      );
    }
  }

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
              const SizedBox(height: 20),
              const Text(
                'Welcome back, you\'re been missed',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Input(
                label: 'Email',
                hintText: 'Email',
                controller: _emailController,
                error: errors['email'] ?? '',
              ),
              const SizedBox(height: 20),
              Input(
                label: 'Password',
                obscureText: true,
                hintText: 'Password',
                controller: _passwordController,
                error: errors['password'] ?? '',
              ),
              const SizedBox(height: 20),
              Button(title: 'Login', onTab: () => login(context)),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Not a Member ? ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Register now',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
