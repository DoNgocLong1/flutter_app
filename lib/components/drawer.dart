import 'package:flutter/material.dart';
import 'package:flutter_app/constant/index.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_app/pages/setting.dart';
import 'package:localstorage/localstorage.dart';

class MainDrawer extends StatelessWidget {
  final List<String> tabs = ['1', '2', '3', '4'];

  MainDrawer({super.key});

  void handleLogout(BuildContext context) {
    localStorage.removeItem('token');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void handleImplementActionBar(int id, BuildContext context) {
    if (id == Constant.drawerList['home']?['id'] as int) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingPage()),
      );
    } else if (id == Constant.drawerList['settings']?['id'] as int) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingPage()),
      );
    } else if (id == Constant.drawerList['logout']?['id'] as int) {
      handleLogout(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Icon(
                  Icons.message,
                  size: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Column(
              children: Constant.drawerList.entries.map((entry) {
                final value = entry.value;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListTile(
                      leading: Icon(
                        value['icon'] as IconData,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      title: Text(
                        value['title'] as String,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      onTap: () => handleImplementActionBar(
                          value['id'] as int, context)),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
