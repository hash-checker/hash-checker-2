import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    builder: (_) => Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Column(
                children: HashType.values.map((hashType) {
              return ListTile(
                title: Text(hashType.name()),
                trailing: hashType == current ? const Icon(Icons.done) : null,
                onTap: () => Navigator.pop<HashType>(
                  context,
                  hashType,
                ),
              );
            }).toList()),
          ),
        ),
      ],
    ),
  );
}
