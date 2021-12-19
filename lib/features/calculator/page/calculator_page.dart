import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hash_checker_2/components/router/app_router.gr.dart';
import 'package:hash_checker_2/components/widgets/app_calculator_action_button.dart';
import 'package:hash_checker_2/data/extensions/hash_type_extensions.dart';
import 'package:hash_checker_2/data/models/hash_action.dart';
import 'package:hash_checker_2/data/models/hash_source.dart';
import 'package:hash_checker_2/features/calculator/page/dialogs/select_hash_aciton_dialog.dart';
import 'package:hash_checker_2/features/calculator/page/dialogs/select_hash_source_dialog.dart';
import 'package:hash_checker_2/features/calculator/page/dialogs/select_hash_type_dialog.dart';
import 'package:hash_checker_2/features/calculator/page/dialogs/text_enter_dialog.dart';
import 'package:hash_checker_2/features/calculator/store/calculator_store.dart';

import 'dialogs/view_source_value_dialog.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  CalculatorStore? _store;

  final TextEditingController _generatedHashController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= CalculatorStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hash Checker'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () => const SettingsPageRoute().show(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => SizedBox(
                width: 144,
                child: OutlinedButton(
                  child: Text(_store!.hashType.name),
                  onPressed: () async {
                    final hashType = await showSelectHashTypeDialog(
                      context: context,
                      current: _store!.hashType,
                    );
                    _store!.setHashType(hashType ?? _store!.hashType);
                  },
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
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Original hash',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Observer(
                    builder: (_) {
                      _generatedHashController.text = _store!.generatedHash;
                      return TextField(
                        controller: _generatedHashController,
                        decoration: const InputDecoration(
                          hintText: 'Generated hash',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) {
                    final hashSource = _store!.hashSource;
                    return AppCalculatorActionButton(
                      text: hashSource == HashSource.none
                          ? 'From'
                          : hashSource == HashSource.file
                              ? 'File'
                              : 'Text',
                      onPressed: () async {
                        final hashSource = await showSelectHashSourceDialog(
                          context: context,
                          showClearButton: _store!.hashSource != HashSource.none,
                        );
                        if (hashSource != null) {
                          switch (hashSource) {
                            case HashSource.file:
                              final result = await FilePicker.platform.pickFiles();
                              if (result != null) {
                                _store!.setFileToGenerate(result.paths.first!);
                              }
                              break;
                            case HashSource.text:
                              final text = await showTextEnterDialog(
                                context: context,
                                current: _store!.textValueToGenerate,
                              );
                              if (text != null) {
                                _store!.setTextValueToGenerate(text);
                              }
                              break;
                            case HashSource.none:
                              _store!.clearSelections();
                              break;
                          }
                        }
                      },
                    );
                  },
                ),
                const SizedBox(width: 8),
                AppCalculatorActionButton(
                  text: 'Action',
                  onPressed: () async {
                    final hashAction = await showSelectHashActionDialog(context);
                    if (hashAction != null) {
                      switch (hashAction) {
                        case HashAction.generate:
                          _store!.generateHash();
                          break;
                        case HashAction.compare:
                          break;
                        case HashAction.export:
                          break;
                      }
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (context) {
                final hashSource = _store!.hashSource;
                return SizedBox(
                  width: 172,
                  height: 48,
                  child: OutlinedButton(
                    child: Text(
                      hashSource == HashSource.none
                          ? 'None'
                          : hashSource == HashSource.file
                              ? _store!.fileToGenerate
                              : _store!.textValueToGenerate,
                    ),
                    onPressed: () => showViewSourceValueDialog(
                      context: context,
                      source: _store!.source,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
