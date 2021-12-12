import 'package:flutter/cupertino.dart';

class AppDependencies extends StatelessWidget {
  final Widget app;

  const AppDependencies({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return app;
  }
}
