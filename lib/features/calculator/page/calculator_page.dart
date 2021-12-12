import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hash_checker_2/data/extensions/hash_type_extensions.dart';
import 'package:hash_checker_2/features/calculator/page/dialogs/select_hash_type_dialog.dart';
import 'package:hash_checker_2/features/calculator/store/calculator_store.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  CalculatorStore? _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= CalculatorStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => OutlinedButton(
                child: Text(_store!.hashType.name()),
                onPressed: () => showSelectHashTypeDialog(
                  context: context,
                  current: _store!.hashType,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(
                left: 48,
                right: 48,
              ),
              child: Column(
                children: const [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Original hash',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Generated hash',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.teal,
                  child: const Text('From'),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                MaterialButton(
                  color: Colors.teal,
                  child: const Text('Action'),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              child: const Text('Filename'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
