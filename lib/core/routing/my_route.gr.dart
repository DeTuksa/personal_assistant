// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../screens/dashboard.dart';

class Routes {
  static const String dashboardScreen = '/';
  static const all = <String>{
    dashboardScreen,
  };
}

class AssistantRoutes extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.dashboardScreen, page: DashboardScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    DashboardScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashboardScreen(),
        settings: data,
      );
    },
  };
}
