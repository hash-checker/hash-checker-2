import 'package:flutter/material.dart';
import 'package:hash_checker_2/extensions/hash_action_extensions.dart';
import 'package:hash_checker_2/model/hash_action.dart';
import 'package:hash_checker_2/ui/widgets/app_rounded_bottom_sheet.dart';

Future<HashAction?> showSelectHashActionDialog(BuildContext context) {
  return showModalBottomSheet<HashAction>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) {
      return AppRoundedBottomSheet(
        child: Column(
          children: HashAction.values.map(
            (hashAction) {
              return ListTile(
                title: Text(hashAction.uiName),
                onTap: () => Navigator.pop<HashAction>(
                  context,
                  hashAction,
                ),
              );
            },
          ).toList(),
        ),
      );
    },
  );
}
