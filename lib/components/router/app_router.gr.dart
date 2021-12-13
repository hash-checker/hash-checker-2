// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../features/calculator/page/calculator_page.dart' as _i1;
import '../../features/settings/page/settings_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CalculatorPageRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CalculatorPage());
    },
    SettingsPageRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SettingsPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(CalculatorPageRoute.name, path: '/'),
        _i3.RouteConfig(SettingsPageRoute.name, path: '/settings-page')
      ];
}

/// generated route for [_i1.CalculatorPage]
class CalculatorPageRoute extends _i3.PageRouteInfo<void> {
  const CalculatorPageRoute() : super(name, path: '/');

  static const String name = 'CalculatorPageRoute';
}

/// generated route for [_i2.SettingsPage]
class SettingsPageRoute extends _i3.PageRouteInfo<void> {
  const SettingsPageRoute() : super(name, path: '/settings-page');

  static const String name = 'SettingsPageRoute';
}
