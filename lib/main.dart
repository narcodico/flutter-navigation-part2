import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/router/app_route_information_parser.dart';
import 'package:flutter_navigation_part_2/router/app_router_delegate.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(App());
}

class App extends StatelessWidget {
  final AppRouterDelegate _appRouteDelegate = AppRouterDelegate();
  final AppRouteInformationParser _appRouteInformationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nested Route',
      routeInformationParser: _appRouteInformationParser,
      routerDelegate: _appRouteDelegate,
    );
  }
}
