import 'package:flutter/material.dart';

class AppSettingsListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final GestureTapCallback? onTap;

  const AppSettingsListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
    );
  }
}
