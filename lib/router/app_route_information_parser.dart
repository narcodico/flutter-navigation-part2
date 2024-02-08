import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_navigation_part_2/router/cubit/listing_route_state.dart';
import 'package:flutter_navigation_part_2/router/cubit/listings_route_state.dart';
import 'package:flutter_navigation_part_2/router/cubit/settings_route_state.dart';

import 'cubit/item_route_state.dart';
import 'cubit/router_cubit.dart';

class AppRouteInformationParser extends RouteInformationParser<RouteState> {
  @override
  Future<RouteState> parseRouteInformation(RouteInformation routeInformation) {
    final uri = routeInformation.uri;
    log('parse uri: $uri with ${uri.pathSegments.length} path segments');
    RouteState routeState;
    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'settings') {
      routeState = SettingsRouteState();
    } else if (uri.pathSegments.length == 2) {
      if (uri.pathSegments.first == 'listings') {
        routeState = ListingRouteState(int.parse(uri.pathSegments[1]));
      } else {
        routeState = ListingsRouteState();
      }
    } else if (uri.pathSegments.length == 3) {
      routeState =
          ItemRouteState(int.parse(uri.pathSegments[1]), uri.pathSegments[2]);
    } else {
      routeState = ListingsRouteState();
    }
    log('parse uri result: $routeState');
    return SynchronousFuture(routeState);
  }

  @override
  RouteInformation? restoreRouteInformation(RouteState config) {
    log('restore path: $config');
    // important to be first since inheritance
    if (config is ItemRouteState) {
      return RouteInformation(
          uri: Uri(path: '/listings/${config.id}/${config.itemId}'));
    }
    if (config is ListingsRouteState) {
      return RouteInformation(uri: Uri(path: '/listings'));
    }
    if (config is ListingRouteState) {
      return RouteInformation(uri: Uri(path: '/listings/${config.id}'));
    }
    if (config is SettingsRouteState) {
      return RouteInformation(uri: Uri(path: '/settings'));
    }
    return null;
  }
}
