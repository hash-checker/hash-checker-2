import 'package:auto_route/annotations.dart';
import 'package:hash_checker_2/features/calculator/page/calculator_page.dart';
import 'package:hash_checker_2/features/settings/page/settings_page.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(
      page: CalculatorPage,
      initial: true,
    ),
    AutoRoute(page: SettingsPage),
  ],
)
class $AppRouter {}
