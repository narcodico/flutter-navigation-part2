import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/router/app_route_path.dart';
import 'package:flutter_navigation_part_2/router/item_route_path.dart';
import 'package:flutter_navigation_part_2/router/listing_route_path.dart';
import 'package:flutter_navigation_part_2/router/listings_route_path.dart';
import 'package:flutter_navigation_part_2/router/settings_route_path.dart';
import 'package:flutter_navigation_part_2/screens/app_shell.dart';
import 'package:flutter_navigation_part_2/screens/listings_flow.dart';
import 'package:flutter_navigation_part_2/screens/studio_flow.dart';
import 'package:flutter_navigation_part_2/state/navigation_state.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  // get app state instance
  NavigationState navigationState = NavigationState();

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    navigationState.addListener(notifyListeners);
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath config) {
    log('setNewRoutePath: $config');
    if (config is ListingsRoutePath) {
      navigationState.selectedListing = null;
      navigationState.selectedItem = null;
    } else if (config is ListingRoutePath) {
      navigationState.setSelectedListingById(config.id);
      navigationState.selectedItem = null;
    } else if (config is ItemRoutePath) {
      navigationState.setSelectedListingById(config.id);
      navigationState.setSelectedItemById(config.itemId);
    }
    return SynchronousFuture(null);
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Navigator(
        key: this.navigatorKey,
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          if (navigationState.selectedListing != null) {
            navigationState.selectedListing = null;
          }
          notifyListeners();
          return true;
        },
        pages: [
          if (navigationState.isAuthenticated)
            StudioFlow.page(navigationState: navigationState)
          else
            ListingsFlow.page(navigationState: navigationState),
        ],
      ),
    );
  }

  @override
  AppRoutePath? get currentConfiguration {
    AppRoutePath? routePath;
    if (navigationState.selectedIndex == 1) {
      routePath = SettingsRoutePath();
    } else if (navigationState.selectedListing == null) {
      routePath = ListingsRoutePath();
    } else if (navigationState.selectedListing != null &&
        navigationState.selectedItem == null) {
      routePath = ListingRoutePath(navigationState.getSelectedListingById());
    } else if (navigationState.selectedListing != null &&
        navigationState.selectedItem != null) {
      routePath = ItemRoutePath(
        navigationState.getSelectedListingById(),
        navigationState.selectedItem!.id,
      );
    } else {
      routePath = null;
    }
    log('app currentConfiguration: $routePath');
    log('app currentConfiguration state: $navigationState');
    return routePath;
  }
}
