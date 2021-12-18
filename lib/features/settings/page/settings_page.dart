import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hash_checker_2/app/app_config.dart';
import 'package:hash_checker_2/components/settings/app_settings_list_item.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final info = snapshot.data!;
          return ListView(
            children: [
              AppSettingsListItem(
                title: 'Bug tracker',
                subtitle: 'Report a bug',
                onTap: () => launch(AppConfig.linkBugTracker),
              ),
              AppSettingsListItem(
                title: 'Privacy Policy',
                onTap: () => launch(AppConfig.linkPrivacyPolicy),
              ),
              AppSettingsListItem(
                title: 'Author',
                subtitle: 'fartem',
                onTap: () => launch(AppConfig.linkAuthor),
              ),
              AppSettingsListItem(
                title: 'Version',
                subtitle: '${info.version} (${info.buildNumber})',
              ),
            ],
          );
        },
      ),
    );
  }
}
