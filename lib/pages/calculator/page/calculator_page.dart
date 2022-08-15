import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hash_checker_2/domain/router/app_router.gr.dart';
import 'package:hash_checker_2/extensions/hash_type_extensions.dart';
import 'package:hash_checker_2/model/hash_action.dart';
import 'package:hash_checker_2/model/hash_compare_result.dart';
import 'package:hash_checker_2/model/hash_source.dart';
import 'package:hash_checker_2/pages/calculator/page/dialogs/select_hash_aciton_dialog.dart';
import 'package:hash_checker_2/pages/calculator/page/dialogs/select_hash_source_dialog.dart';
import 'package:hash_checker_2/pages/calculator/page/dialogs/select_hash_type_dialog.dart';
import 'package:hash_checker_2/pages/calculator/page/dialogs/text_enter_dialog.dart';
import 'package:hash_checker_2/pages/calculator/page/dialogs/view_source_value_dialog.dart';
import 'package:hash_checker_2/pages/calculator/store/calculator_store.dart';
import 'package:hash_checker_2/ui/widgets/app_calculator_action_button.dart';
import 'package:hash_checker_2/ui/widgets/app_text_copy_button.dart';
import 'package:hash_checker_2/ui/widgets/app_text_paste_button.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  CalculatorPageState createState() => CalculatorPageState();
}

class CalculatorPageState extends State<CalculatorPage> {
  CalculatorStore? _store;

  final _originalHashController = TextEditingController();
  final _generatedHashController = TextEditingController();

  final _originalHashFocus = FocusNode();
  final _generatedHashFocus = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= CalculatorStore();
  }

  @override
  void initState() {
    _originalHashController.addListener(() => _store?.setOriginalHash(_originalHashController.text));
    _generatedHashController.addListener(() => _store?.setGeneratedHash(_generatedHashController.text));
    super.initState();
  }

  @override
  void dispose() {
    _generatedHashController.dispose();
    _originalHashController.dispose();
    super.dispose();
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
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => SizedBox(
                width: 144,
                child: OutlinedButton(
                  child: Text(_store!.hashType.uiName),
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
            Observer(builder: (_) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextPasteButton(
                          textEditingController: _originalHashController,
                          isVisible: _store!.originalHash.isNotEmpty,
                        ),
                        const SizedBox(width: 4),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            controller: _originalHashController,
                            focusNode: _originalHashFocus,
                            decoration: const InputDecoration(
                              hintText: 'Original hash',
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        AppTextCopyButton(
                          textEditingController: _originalHashController,
                          isVisible: _store!.originalHash.isNotEmpty,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Observer(
                      builder: (_) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppTextPasteButton(
                              textEditingController: _generatedHashController,
                              isVisible: _store!.generatedHash.isNotEmpty,
                            ),
                            const SizedBox(width: 4),
                            SizedBox(
                              width: 250,
                              child: TextField(
                                controller: _generatedHashController,
                                focusNode: _generatedHashFocus,
                                decoration: const InputDecoration(
                                  hintText: 'Generated hash',
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            AppTextCopyButton(
                              textEditingController: _generatedHashController,
                              isVisible: _store!.generatedHash.isNotEmpty,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              );
            }),
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
                        _originalHashFocus.unfocus();
                        _generatedHashFocus.unfocus();
                        final hashSource = await showSelectHashSourceDialog(
                          context: context,
                          values: _store!.hashSource != HashSource.none
                              ? HashSource.values
                              : [
                                  HashSource.file,
                                  HashSource.text,
                                ],
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
                    _originalHashFocus.unfocus();
                    _generatedHashFocus.unfocus();
                    final hashAction = await showSelectHashActionDialog(context);
                    if (hashAction != null) {
                      switch (hashAction) {
                        case HashAction.generate:
                          _store!.generateHash();
                          _generatedHashController.text = _store!.generatedHash;
                          break;
                        case HashAction.compare:
                          final result = _store!.compare();
                          switch (result) {
                            case HashCompareResult.match:
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Match'),
                                  action: SnackBarAction(
                                    label: 'OK',
                                    onPressed: () => ScaffoldMessenger.of(context).clearSnackBars(),
                                  ),
                                ),
                              );
                              break;
                            case HashCompareResult.doNotMatch:
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Do not match'),
                                  action: SnackBarAction(
                                    label: 'OK',
                                    onPressed: () => ScaffoldMessenger.of(context).clearSnackBars(),
                                  ),
                                ),
                              );
                              break;
                          }
                          break;
                        case HashAction.export:
                          if (_store!.canSaveGeneratedHashResult) {
                            final saveParams = SaveFileDialogParams(
                              data: _store!.generatedHashToFile,
                              fileName: _store!.fileNameForGeneratedHash,
                            );
                            await FlutterFileDialog.saveFile(params: saveParams);
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Please generate hash value before save result',
                                ),
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () => ScaffoldMessenger.of(context).clearSnackBars(),
                                ),
                              ),
                            );
                          }
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
                              ? _store!.fileToGenerate.substring(_store!.fileToGenerate.lastIndexOf('/') + 1)
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
