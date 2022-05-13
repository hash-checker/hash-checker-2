import 'package:flutter/material.dart';
import 'package:hash_checker_2/extensions/hash_source_extensions.dart';
import 'package:hash_checker_2/model/hash_source.dart';
import 'package:hash_checker_2/ui/widgets/app_rounded_bottom_sheet.dart';

Future<HashSource?> showSelectHashSourceDialog({
  required BuildContext context,
  required List<HashSource> values,
}) {
  return showModalBottomSheet<HashSource>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) {
      return AppRoundedBottomSheet(
        child: Column(
          children: values.map(
            (hashSource) {
              return ListTile(
                title: Text(hashSource.uiName),
                onTap: () => Navigator.pop<HashSource>(
                  context,
                  hashSource,
                ),
              );
            },
          ).toList(),
        ),
      );
    },
  );
}
