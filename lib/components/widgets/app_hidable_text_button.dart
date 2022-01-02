import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppHidableTextButton extends StatelessWidget {
  final IconData icon;
  final TextEditingController textEditingController;
  final bool isVisible;
  final GestureTapCallback onTap;

  const AppHidableTextButton({
    Key? key,
    required this.icon,
    required this.textEditingController,
    required this.isVisible,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: InkWell(
        child: Icon(
          icon,
          color: Colors.teal,
        ),
        onTap: onTap,
      ),
    );
  }
}
