import 'package:hash_checker_2/data/models/app_theme.dart';

abstract class SettingsRepository {
  Future<SettingsRepository> load();

  void changeTheme(AppTheme theme);

  AppTheme currentTheme();
}
