import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoundedBottomSheet extends StatelessWidget {
  final Widget child;

  const AppRoundedBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
