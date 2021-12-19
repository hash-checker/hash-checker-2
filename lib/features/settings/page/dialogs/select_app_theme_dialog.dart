import 'package:flutter/material.dart';
import 'package:hash_checker_2/components/widgets/app_rounded_bottom_sheet.dart';
import 'package:hash_checker_2/data/extensions/app_theme_extensions.dart';
import 'package:hash_checker_2/data/models/app_theme.dart';

Future<AppTheme?> showSelectAppThemeDialog({
  required BuildContext context,
  required AppTheme current,
}) {
  return showModalBottomSheet<AppTheme>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => AppRoundedBottomSheet(
      child: Column(
        children: AppTheme.values.map(
              (appTheme) {
            return ListTile(
              title: Text(appTheme.name),
              trailing: appTheme == current ? const Icon(Icons.done) : null,
              onTap: () => Navigator.pop<AppTheme>(
                context,
                appTheme,
              ),
            );
          },
        ).toList(),
      ),
    ),
  );
}
