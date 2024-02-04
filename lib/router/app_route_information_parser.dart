import 'package:flutter/cupertino.dart';
import 'package:flutter_navigation_part_2/router/app_route_path.dart';
import 'package:flutter_navigation_part_2/router/listing_route_path.dart';
import 'package:flutter_navigation_part_2/router/listings_route_path.dart';
import 'package:flutter_navigation_part_2/router/settings_route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'settings') {
      return SettingsRoutePath();
    } else if (uri.pathSegments.length == 2 &&
        uri.pathSegments[0] == 'listings') {
      return ListingRoutePath(int.parse(uri.pathSegments[1]));
    } else {
      return ListingsRoutePath();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath config) {
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
