import 'package:flutter/material.dart';

class AppHidableTextButton extends StatelessWidget {
  final IconData icon;
  final TextEditingController textEditingController;
  final bool isVisible;
  final GestureTapCallback onTap;

  const AppHidableTextButton({
    required this.icon,
    required this.textEditingController,
    required this.isVisible,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: Colors.teal,
        ),
      ),
    );
  }
}
