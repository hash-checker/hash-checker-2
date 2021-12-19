import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hash_checker_2/components/widgets/app_rounded_bottom_sheet.dart';
import 'package:hash_checker_2/data/extensions/hash_type_extensions.dart';
import 'package:hash_checker_2/data/models/hash_type.dart';

Future<HashType?> showSelectHashTypeDialog({
  required BuildContext context,
  required HashType current,
}) {
  return showModalBottomSheet<HashType>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => AppRoundedBottomSheet(
      child: Column(
        children: HashType.values.map(
          (hashType) {
            return ListTile(
              title: Text(hashType.name),
              trailing: hashType == current ? const Icon(Icons.done) : null,
              onTap: () => Navigator.pop<HashType>(
                context,
                hashType,
              ),
            );
          },
        ).toList(),
      ),
    ),
  );
}
