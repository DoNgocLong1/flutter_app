import 'package:flutter/material.dart';
import 'package:flutter_app/components/drawer.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:localstorage/localstorage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void handleLogout(BuildContext context) {
    localStorage.removeItem('token');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () => handleLogout(context),
                icon: const Icon(Icons.logout))
          ],
        ),
        drawer: MainDrawer(),
      ),
    );
  }
}
