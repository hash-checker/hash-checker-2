import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSettingsListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final GestureTapCallback? onTap;

  const AppSettingsListItem({
    Key? key,
    required this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
    );
  }
}
