import 'package:flutter/material.dart';
import 'package:hash_checker_2/app/app_dependencies.dart';
import 'package:hash_checker_2/components/themes/themes.dart';
import 'package:hash_checker_2/data/extensions/app_theme_extensions.dart';
import 'package:hash_checker_2/data/repositories/settings/api/settings_repository.dart';
import 'package:provider/provider.dart';

import 'components/router/app_router.gr.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      app: Builder(
        builder: (context) {
          final theme = context.read<SettingsRepository>().currentTheme();
          return MaterialApp.router(
            title: 'Hash Checker 2',
            themeMode: theme.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
