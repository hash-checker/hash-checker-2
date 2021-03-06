import 'package:flutter/material.dart';
import 'package:hash_checker_2/ui/widgets/app_rounded_bottom_sheet.dart';

Future<void> showViewSourceValueDialog({
  required BuildContext context,
  required String source,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) {
      return AppRoundedBottomSheet(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Text(source),
        ),
      );
    },
  );
}
