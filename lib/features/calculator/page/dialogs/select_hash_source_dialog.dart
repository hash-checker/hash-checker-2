import 'package:flutter/material.dart';
import 'package:hash_checker_2/data/models/hash_source.dart';

Future<HashSource?> showSelectHashSourceDialog(BuildContext context) {
  return showModalBottomSheet<HashSource>(
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
                children: HashSource.values.map((hashSource) {
                  return ListTile(
                    title: Text(hashSource.toString()),
                    onTap: () => Navigator.pop<HashSource>(
                      context,
                      hashSource,
                    ),
                  );
                }).toList()),
          ),
        ),
      ],
    ),
  );
}

