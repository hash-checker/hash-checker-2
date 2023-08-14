import 'package:flutter/material.dart';
import 'package:hash_checker_2/extensions/hash_type_extensions.dart';
import 'package:hash_checker_2/model/hash_type.dart';

Future<HashType?> showSelectHashTypeDialog({
  required BuildContext context,
  required HashType current,
}) {
  return showModalBottomSheet<HashType>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.2,
      maxChildSize: 0.75,
      expand: false,
      builder: (_, controller) => ListView(
        controller: controller,
        padding: const EdgeInsets.all(8),
        children: HashType.values.map(
          (hashType) {
            return ListTile(
              tileColor: Colors.white,
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
    ),
  );
}
