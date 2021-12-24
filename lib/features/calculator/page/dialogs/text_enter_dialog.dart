import 'package:flutter/material.dart';

Future<String?> showTextEnterDialog({
  required BuildContext context,
  required String current,
}) {
  return showDialog<String>(
    context: context,
    builder: (_) => _TextEnterDialog(
      current: current,
    ),
  );
}

class _TextEnterDialog extends StatefulWidget {
  final String current;

  const _TextEnterDialog({
    Key? key,
    required this.current,
  }) : super(key: key);

  @override
  _TextEnterDialogState createState() => _TextEnterDialogState();
}

class _TextEnterDialogState extends State<_TextEnterDialog> {
  late TextEditingController _textEditingController;
  final _textEditingFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(
      text: widget.current,
    );
    WidgetsBinding.instance!.addPostFrameCallback((_) => _textEditingFocusNode.requestFocus());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      title: const Text('Text'),
      insetPadding: const EdgeInsets.all(16),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: _textEditingController,
          focusNode: _textEditingFocusNode,
          decoration: const InputDecoration(
            hintText: 'Text',
          ),
        ),
      ),
      actions: [
        MaterialButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop<String>(context),
        ),
        MaterialButton(
          child: const Text('Apply'),
          onPressed: () => Navigator.pop<String>(
            context,
            _textEditingController.text,
          ),
        ),
      ],
    );
  }
}
