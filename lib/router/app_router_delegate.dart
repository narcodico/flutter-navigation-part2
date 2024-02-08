import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/router/cubit/item_route_state.dart';
import 'package:flutter_navigation_part_2/router/cubit/listing_route_state.dart';
import 'package:flutter_navigation_part_2/router/cubit/listings_route_state.dart';
import 'package:flutter_navigation_part_2/router/cubit/settings_route_state.dart';
import 'package:flutter_navigation_part_2/screens/app_shell.dart';
import 'package:flutter_navigation_part_2/screens/listings_flow.dart';
import 'package:flutter_navigation_part_2/screens/studio_flow.dart';
import 'package:flutter_navigation_part_2/state/navigation_state.dart';

import 'cubit/router_cubit.dart';

class AppRouterDelegate extends RouterDelegate<RouteState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteState> {
  final GlobalKey<NavigatorState> navigatorKey;

  // get app state instance
  NavigationState navigationState = NavigationState();

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    navigationState.addListener(notifyListeners);
  }

  @override
  Future<void> setNewRoutePath(RouteState config) {
    log('setNewRoutePath: $config');
    if (config is ListingsRouteState) {
      navigationState.selectedListing = null;
      navigationState.selectedItem = null;
    } else if (config is ListingRouteState) {
      navigationState.setSelectedListingById(config.id);
      navigationState.selectedItem = null;
    } else if (config is ItemRouteState) {
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
  RouteState? get currentConfiguration {
    RouteState? routeState;
    if (navigationState.selectedIndex == 1) {
      routeState = SettingsRouteState();
    } else if (navigationState.selectedListing == null) {
      routeState = ListingsRouteState();
    } else if (navigationState.selectedListing != null &&
        navigationState.selectedItem == null) {
      routeState = ListingRouteState(navigationState.getSelectedListingById());
    } else if (navigationState.selectedListing != null &&
        navigationState.selectedItem != null) {
      routeState = ItemRouteState(
        navigationState.getSelectedListingById(),
        navigationState.selectedItem!.id,
      );
    } else {
      routeState = null;
    }
    log('app currentConfiguration: $routeState');
    log('app currentConfiguration state: $navigationState');
    return routeState;
  }
}
