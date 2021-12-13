import 'package:flutter/material.dart';

import 'components/router/app_router.gr.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hash Checker 2',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
