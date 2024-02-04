import 'package:flutter/cupertino.dart';
import 'package:flutter_navigation_part_2/router/RecipeDetailsPath.dart';
import 'package:flutter_navigation_part_2/router/RecipeListPath.dart';
import 'package:flutter_navigation_part_2/router/RecipeRoutePath.dart';
import 'package:flutter_navigation_part_2/router/RecipeSettingPath.dart';

class RecipeRouteInformationParser
    extends RouteInformationParser<RecipeRoutePath> {
  @override
  Future<RecipeRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'settings') {
      return RecipeSettingPath();
    } else {
      if (uri.pathSegments.length >= 2) {
        if (uri.pathSegments[0] == 'recipe') {
          return RecipeDetailsPath(int.parse(uri.pathSegments[1]));
        }
      }
      return RecipeListPath();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RecipeRoutePath config) {
    if (config is RecipeListPath) {
      return RouteInformation(uri: Uri(path: '/home'));
    }
    if (config is RecipeDetailsPath) {
      return RouteInformation(uri: Uri(path: '/recipe/${config.id}'));
    }
    if (config is RecipeSettingPath) {
      return RouteInformation(uri: Uri(path: '/settings'));
    }
    return null;
  }
}
