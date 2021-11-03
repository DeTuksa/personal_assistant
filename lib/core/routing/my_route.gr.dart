// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../screens/dashboard.dart' as _i1;
import '../../screens/listening_screen.dart' as _i2;

class AssistantRoutes extends _i3.RootStackRouter {
  AssistantRoutes([_i4.GlobalKey<_i4.NavigatorState> navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DashboardScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.DashboardScreen());
    },
    ListeningScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.ListeningScreen());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(DashboardScreenRoute.name, path: '/'),
        _i3.RouteConfig(ListeningScreenRoute.name, path: '/listening-screen')
      ];
}

/// generated route for [_i1.DashboardScreen]
class DashboardScreenRoute extends _i3.PageRouteInfo<void> {
  const DashboardScreenRoute() : super(name, path: '/');

  static const String name = 'DashboardScreenRoute';
}

/// generated route for [_i2.ListeningScreen]
class ListeningScreenRoute extends _i3.PageRouteInfo<void> {
  const ListeningScreenRoute() : super(name, path: '/listening-screen');

  static const String name = 'ListeningScreenRoute';
}
