import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final void Function()? onTab;

  const Button({
    super.key,
    this.title = 'Click me',
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
