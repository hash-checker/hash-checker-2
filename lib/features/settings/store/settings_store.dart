import 'package:hash_checker_2/data/models/app_theme.dart';
import 'package:hash_checker_2/data/repositories/settings/api/settings_repository.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  final SettingsRepository settingsRepository;

  @observable
  AppTheme? currentTheme;

  _SettingsStore({required this.settingsRepository}) {
    currentTheme = settingsRepository.currentTheme();
  }

  @action
  void changeTheme(AppTheme theme) {
    currentTheme = theme;
    settingsRepository.changeTheme(theme);
  }
}
