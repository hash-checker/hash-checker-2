import 'package:flutter/material.dart';

class AppCalculatorActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppCalculatorActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.teal,
      child: Text(text),
      textColor: Colors.white,
      onPressed: onPressed,
    );
  }
}
