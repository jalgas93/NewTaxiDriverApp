// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../taxi_driver/pages/dashboard_page.dart';
import '../taxi_driver/pages/map_page.dart';
import '../taxi_driver/pages/select_transport.dart';
import '../taxi_driver/pages/taxi_page.dart';
import '../taxi_driver/pages/transport_page.dart';

class Routes {
  static const String dashboardPage = '/';
  static const String taxiPage = '/taxi-page';
  static const String mapPage = '/map-page';
  static const String selectTransport = '/select-transport';
  static const String transportPage = '/transport-page';
  static const all = <String>{
    dashboardPage,
    taxiPage,
    mapPage,
    selectTransport,
    transportPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.dashboardPage, page: DashboardPage),
    RouteDef(Routes.taxiPage, page: TaxiPage),
    RouteDef(Routes.mapPage, page: MapPage),
    RouteDef(Routes.selectTransport, page: SelectTransport),
    RouteDef(Routes.transportPage, page: TransportPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    DashboardPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DashboardPage(),
        settings: data,
      );
    },
    TaxiPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const TaxiPage(),
        settings: data,
      );
    },
    MapPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MapPage(),
        settings: data,
      );
    },
    SelectTransport: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SelectTransport(),
        settings: data,
      );
    },
    TransportPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const TransportPage(),
        settings: data,
      );
    },
  };
}
