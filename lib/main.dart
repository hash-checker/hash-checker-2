import 'package:flutter/material.dart';
import 'package:hash_checker_2/app/app_dependencies.dart';
import 'package:hash_checker_2/components/themes/themes.dart';
import 'package:hash_checker_2/data/extensions/app_theme_extensions.dart';
import 'package:hash_checker_2/data/models/app_theme.dart';
import 'package:hash_checker_2/data/repositories/settings/api/settings_repository.dart';
import 'package:provider/provider.dart';

import 'components/router/app_router.gr.dart';

void main() => runApp(const AppDependencies(app: App()));

class App extends StatefulWidget {

  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    final widgetBindings = WidgetsBinding.instance;
    final window = widgetBindings.window;
    window.onPlatformBrightnessChanged = () {
      if (context.read<SettingsRepository>().currentTheme() == AppTheme.system) {
        widgetBindings.handlePlatformBrightnessChanged();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.read<SettingsRepository>().currentTheme();
    return MaterialApp.router(
      title: 'Hash Checker 2',
      themeMode: theme.themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
