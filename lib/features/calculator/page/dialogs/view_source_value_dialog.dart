import 'package:flutter/material.dart';
import 'package:hash_checker_2/components/widgets/app_rounded_bottom_sheet.dart';

Future<void> showViewSourceValueDialog({
  required BuildContext context,
  required String source,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => AppRoundedBottomSheet(
      child: Text(source),
    ),
  );
}
