
import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_route_generator/import_resolver.dart';
import 'package:taxi_driver/modules/taxi_driver/pages/dashboard_page.dart';
import 'package:taxi_driver/modules/taxi_driver/pages/map_page.dart';
import 'package:taxi_driver/modules/taxi_driver/pages/select_transport.dart';
import 'package:taxi_driver/modules/taxi_driver/pages/taxi_page.dart';
import 'package:taxi_driver/modules/taxi_driver/pages/transport_page.dart';

@MaterialAutoRouter(routes:<AutoRoute>[
AutoRoute(initial : true,page: DashboardPage),
  AutoRoute(page: TaxiPage),
  AutoRoute(page: MapPage),
    AutoRoute(page: SelectTransport),
    AutoRoute(page: TransportPage),


])

class $AppRouter{

}