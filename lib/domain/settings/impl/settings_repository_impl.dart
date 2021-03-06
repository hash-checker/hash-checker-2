import 'package:hash_checker_2/domain/settings/api/settings_repository.dart';
import 'package:hash_checker_2/model/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _keyTheme = 'theme';

class SettingsRepositoryImpl extends SettingsRepository {
  late SharedPreferences prefs;

  @override
  Future<SettingsRepository> load() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  @override
  void changeTheme(AppTheme theme) => prefs.setString(_keyTheme, theme.name);

  @override
  AppTheme currentTheme() {
    if (prefs.containsKey(_keyTheme)) {
      final theme = prefs.getString(_keyTheme);
      return AppTheme.values.byName(theme ?? 'light');
    }
    return AppTheme.system;
  }
}
