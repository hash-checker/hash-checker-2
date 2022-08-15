import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hash_checker_2/components/widgets/app_hidable_text_button.dart';

class AppTextPasteButton extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isVisible;

  const AppTextPasteButton({
    super.key,
    required this.textEditingController,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return AppHidableTextButton(
      icon: Icons.paste,
      textEditingController: textEditingController,
      isVisible: isVisible,
      onTap: () async {
        final data = (await Clipboard.getData('text/plain'))?.text;
        if (data != null) {
          textEditingController.text = data;
        }
      },
    );
  }
}
