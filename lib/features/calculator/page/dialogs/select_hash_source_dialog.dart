import 'package:flutter/material.dart';
import 'package:hash_checker_2/components/widgets/app_rounded_bottom_sheet.dart';
import 'package:hash_checker_2/data/extensions/hash_source_extensions.dart';
import 'package:hash_checker_2/data/models/hash_source.dart';

Future<HashSource?> showSelectHashSourceDialog(BuildContext context) {
  return showModalBottomSheet<HashSource>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => AppRoundedBottomSheet(
      child: Column(
        children: HashSource.values.map(
          (hashSource) {
            return ListTile(
              title: Text(hashSource.name()),
              onTap: () => Navigator.pop<HashSource>(
                context,
                hashSource,
              ),
            );
          },
        ).toList(),
      ),
    ),
  );
}
