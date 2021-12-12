import 'package:flutter/material.dart';
import 'package:hash_checker_2/data/models/hash_action.dart';

Future<HashAction?> showSelectHashActionDialog(BuildContext context) {
  return showModalBottomSheet<HashAction>(
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
                children: HashAction.values.map((hashAction) {
                  return ListTile(
                    title: Text(hashAction.toString()),
                    onTap: () => Navigator.pop<HashAction>(
                      context,
                      hashAction,
                    ),
                  );
                }).toList()),
          ),
        ),
      ],
    ),
  );
}
