import 'package:flutter/material.dart';

class AppCalculatorActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppCalculatorActionButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.teal,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
