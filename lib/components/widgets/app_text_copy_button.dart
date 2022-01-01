import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextCopyButton extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isVisible;

  const AppTextCopyButton({
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
          Icons.copy,
          color: Colors.teal,
        ),
        onTap: () async {
          final clipboard = ClipboardData(
            text: textEditingController.text,
          );
          await Clipboard.setData(clipboard);
        },
      ),
    );
  }
}
