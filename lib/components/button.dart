import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;

  const Button({super.key, this.title = 'Click me'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
