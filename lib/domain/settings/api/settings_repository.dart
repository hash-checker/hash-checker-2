import 'package:hash_checker_2/model/app_theme.dart';

abstract class SettingsRepository {
  Future<SettingsRepository> load();

  void changeTheme(AppTheme theme);

  AppTheme currentTheme();
}
