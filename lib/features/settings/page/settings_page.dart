import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hash_checker_2/app/app_config.dart';
import 'package:hash_checker_2/components/settings/app_settings_list_item.dart';
import 'package:hash_checker_2/data/extensions/app_theme_extensions.dart';
import 'package:hash_checker_2/data/repositories/settings/api/settings_repository.dart';
import 'package:hash_checker_2/features/settings/page/dialogs/select_app_theme_dialog.dart';
import 'package:hash_checker_2/features/settings/store/settings_store.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SettingsStore? _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= SettingsStore(
      settingsRepository: context.read<SettingsRepository>(),
    );
  }

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
              Observer(
                builder: (_) => AppSettingsListItem(
                  title: 'Theme',
                  subtitle: _store!.currentTheme!.name,
                  onTap: () async {
                    final newTheme = await showSelectAppThemeDialog(
                      context: context,
                      current: _store!.currentTheme!,
                    );
                    if (newTheme != null) {
                      _store!.changeTheme(newTheme);
                    }
                  },
                ),
              ),
              AppSettingsListItem(
                title: 'Bug tracker',
                subtitle: 'Report a bug',
                onTap: () => launchUrl(Uri.parse(AppConfig.linkBugTracker)),
              ),
              AppSettingsListItem(
                title: 'Privacy Policy',
                onTap: () => launchUrl(Uri.parse(AppConfig.linkPrivacyPolicy)),
              ),
              AppSettingsListItem(
                title: 'Author',
                subtitle: 'fartem',
                onTap: () => launchUrl(Uri.parse(AppConfig.linkAuthor)),
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
