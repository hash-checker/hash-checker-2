import 'package:flutter/material.dart';

class AppRoundedBottomSheet extends StatelessWidget {
  final Widget child;

  const AppRoundedBottomSheet({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.all(
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
