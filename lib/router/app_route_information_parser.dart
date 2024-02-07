import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_navigation_part_2/router/app_route_path.dart';
import 'package:flutter_navigation_part_2/router/listing_route_path.dart';
import 'package:flutter_navigation_part_2/router/listings_route_path.dart';
import 'package:flutter_navigation_part_2/router/settings_route_path.dart';

import 'item_route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = routeInformation.uri;
    log('parse uri: $uri with ${uri.pathSegments.length} path segments');
    AppRoutePath routePath;
    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'settings') {
      routePath = SettingsRoutePath();
    } else if (uri.pathSegments.length == 2) {
      if (uri.pathSegments.first == 'listings') {
        routePath = ListingRoutePath(int.parse(uri.pathSegments[1]));
      } else {
        routePath = ListingsRoutePath();
      }
    } else if (uri.pathSegments.length == 3) {
      routePath =
          ItemRoutePath(int.parse(uri.pathSegments[1]), uri.pathSegments[2]);
    } else {
      routePath = ListingsRoutePath();
    }
    log('parse uri result: $routePath');
    return SynchronousFuture(routePath);
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath config) {
    log('restore path: $config');
    // important to be first since inheritance
    if (config is ItemRoutePath) {
      return RouteInformation(
          uri: Uri(path: '/listings/${config.id}/${config.itemId}'));
    }
    if (config is ListingsRoutePath) {
      return RouteInformation(uri: Uri(path: '/listings'));
    }
    if (config is ListingRoutePath) {
      return RouteInformation(uri: Uri(path: '/listings/${config.id}'));
    }
    if (config is SettingsRoutePath) {
      return RouteInformation(uri: Uri(path: '/settings'));
    }
    return null;
  }
}
