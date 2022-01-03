import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hash_checker_2/components/widgets/app_hidable_text_button.dart';

class AppTextCopyButton extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isVisible;

  const AppTextCopyButton({
    required this.textEditingController,
    required this.isVisible,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppHidableTextButton(
      icon: Icons.copy,
      textEditingController: textEditingController,
      isVisible: isVisible,
      onTap: () async {
        final clipboard = ClipboardData(
          text: textEditingController.text,
        );
        await Clipboard.setData(clipboard);
      },
    );
  }
}
