import 'package:flutter/cupertino.dart';
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

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(
      text: widget.current,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: _textEditingController,
      ),
      actions: [
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
