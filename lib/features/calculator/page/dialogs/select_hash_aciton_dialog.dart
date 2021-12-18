import 'package:flutter/material.dart';
import 'package:hash_checker_2/components/widgets/app_rounded_bottom_sheet.dart';
import 'package:hash_checker_2/data/extensions/hash_action_extensions.dart';
import 'package:hash_checker_2/data/models/hash_action.dart';

Future<HashAction?> showSelectHashActionDialog(BuildContext context) {
  return showModalBottomSheet<HashAction>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => AppRoundedBottomSheet(
      child: Column(
        children: HashAction.values.map(
          (hashAction) {
            return ListTile(
              title: Text(hashAction.name()),
              onTap: () => Navigator.pop<HashAction>(
                context,
                hashAction,
              ),
            );
          },
        ).toList(),
      ),
    ),
  );
}
