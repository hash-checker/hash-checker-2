import 'package:flutter/material.dart';
import 'package:hash_checker_2/di/app_dependencies.dart';
import 'package:hash_checker_2/domain/router/app_router.gr.dart';
import 'package:hash_checker_2/domain/settings/api/settings_repository.dart';
import 'package:hash_checker_2/extensions/app_theme_extensions.dart';
import 'package:hash_checker_2/model/app_theme.dart';
import 'package:hash_checker_2/ui/themes/themes.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppDependencies(app: App()));

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    final widgetBindings = WidgetsBinding.instance!;
    widgetBindings.window.onPlatformBrightnessChanged = () {
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
