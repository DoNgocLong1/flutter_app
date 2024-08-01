import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final bool obscureText;
  final String hintText;
  final String error;
  final TextEditingController controller;

  const Input({
    super.key,
    this.label = '',
    this.obscureText = false,
    this.hintText = '',
    required this.controller,
    this.error = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label.isNotEmpty) Text(label),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hintText,
          ),
        ),
        const SizedBox(height: 10),
        if (error.isNotEmpty)
          Text(
            error,
            style: const TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
