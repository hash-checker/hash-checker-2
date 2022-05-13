import 'package:flutter/material.dart';
import 'package:hash_checker_2/extensions/hash_type_extensions.dart';
import 'package:hash_checker_2/model/hash_type.dart';
import 'package:hash_checker_2/ui/widgets/app_rounded_bottom_sheet.dart';

Future<HashType?> showSelectHashTypeDialog({
  required BuildContext context,
  required HashType current,
}) {
  return showModalBottomSheet<HashType>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) {
      return AppRoundedBottomSheet(
        child: Column(
          children: HashType.values.map(
            (hashType) {
              return ListTile(
                title: Text(hashType.uiName),
                trailing: hashType == current ? const Icon(Icons.done) : null,
                onTap: () => Navigator.pop<HashType>(
                  context,
                  hashType,
                ),
              );
            },
          ).toList(),
        ),
      );
    },
  );
}
