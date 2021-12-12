import 'package:flutter/material.dart';
import 'package:hash_checker_2/app/app_dependencies.dart';
import 'package:hash_checker_2/features/calculator/page/calculator_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hash Checker 2',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const AppDependencies(
        app: CalculatorPage(),
      ),
    );
  }
}
