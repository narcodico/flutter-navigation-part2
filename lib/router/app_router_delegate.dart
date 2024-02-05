import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/router/app_route_path.dart';
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
  Future<void> setNewRoutePath(AppRoutePath config) async {
    log('app: $config');
    if (config is ListingsRoutePath) {
      navigationState.selectedListing = null;
    } else if (config is ListingRoutePath) {
      navigationState.setSelectedListingById(config.id);
    }
    // if (config is ListingsRoutePath) {
    //   // homeScreen
    //   navigationState.selectedIndex = 0;
    //   navigationState.selectedListing = null;
    // } else if (config is ListingRoutePath) {
    //   // nested home/ details screen
    //   navigationState.setSelectedListingById(config.id);
    // } else if (config is SettingsRoutePath) {
    //   // setting screen
    //   navigationState.selectedIndex = 1;
    // }
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
    if (navigationState.selectedIndex == 1) {
      return SettingsRoutePath();
    } else {
      if (navigationState.selectedListing == null) {
        return ListingsRoutePath();
      } else {
        return ListingRoutePath(navigationState.getSelectedListingById());
      }
    }
  }
}
