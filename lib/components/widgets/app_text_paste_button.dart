import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextPasteButton extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isVisible;

  const AppTextPasteButton({
    Key? key,
    required this.textEditingController,
    required this.isVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: InkWell(
        child: const Icon(
          Icons.paste,
          color: Colors.teal,
        ),
        onTap: () async {
          final data = (await Clipboard.getData('text/plain'))?.text;
          if (data != null) {
            textEditingController.text = data;
          }
        },
      ),
    );
  }
}
