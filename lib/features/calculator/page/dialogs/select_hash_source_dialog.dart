import 'package:flutter/material.dart';
import 'package:hash_checker_2/components/widgets/app_rounded_bottom_sheet.dart';
import 'package:hash_checker_2/data/extensions/hash_source_extensions.dart';
import 'package:hash_checker_2/data/models/hash_source.dart';

Future<HashSource?> showSelectHashSourceDialog({
  required BuildContext context,
  required showClearButton,
}) {
  final values = showClearButton ? _allActions : _sourceActions;
  return showModalBottomSheet<HashSource>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => AppRoundedBottomSheet(
      child: Column(
        children: values.map(
          (hashSource) {
            return ListTile(
              title: Text(hashSource.name),
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

List<HashSource> get _allActions => HashSource.values;

List<HashSource> get _sourceActions => [
      HashSource.file,
      HashSource.text,
    ];
