import 'package:flutter/material.dart';
import 'package:hash_checker_2/extensions/app_theme_extensions.dart';
import 'package:hash_checker_2/model/app_theme.dart';
import 'package:hash_checker_2/ui/widgets/app_rounded_bottom_sheet.dart';

Future<AppTheme?> showSelectAppThemeDialog({
  required BuildContext context,
  required AppTheme current,
}) {
  return showModalBottomSheet<AppTheme>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) {
      return AppRoundedBottomSheet(
        child: Column(
          children: AppTheme.values.map(
            (appTheme) {
              return ListTile(
                title: Text(appTheme.uiName),
                trailing: appTheme == current ? const Icon(Icons.done) : null,
                onTap: () => Navigator.pop<AppTheme>(
                  context,
                  appTheme,
                ),
              );
            },
          ).toList(),
        ),
      );
    },
  );
}
