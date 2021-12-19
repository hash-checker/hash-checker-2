import 'package:hash_checker_2/data/models/app_theme.dart';
import 'package:hash_checker_2/data/repositories/settings/api/settings_repository.dart';
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
  void changeTheme(AppTheme theme) => prefs.setString(
        _keyTheme,
        theme == AppTheme.light ? 'light' : 'dark',
      );

  @override
  AppTheme currentTheme() {
    if (prefs.containsKey(_keyTheme)) {
      return prefs.getString(_keyTheme) == 'light' ? AppTheme.light : AppTheme.dark;
    }
    return AppTheme.system;
  }
}
