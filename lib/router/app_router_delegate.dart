import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/app_shell.dart';
import 'package:flutter_navigation_part_2/router/app_route_path.dart';
import 'package:flutter_navigation_part_2/router/listing_route_path.dart';
import 'package:flutter_navigation_part_2/router/listings_route_path.dart';
import 'package:flutter_navigation_part_2/router/settings_route_path.dart';
import 'package:flutter_navigation_part_2/state/navigation_state.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  // get app state instance
  NavigationState appState = NavigationState();

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    appState.addListener(notifyListeners);
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath config) async {
    if (config is ListingsRoutePath) {
      // homeScreen
      appState.selectedIndex = 0;
      appState.selectedListing = null;
    } else if (config is ListingRoutePath) {
      // nested home/ details screen
      appState.setSelectedListingById(config.id);
    } else if (config is SettingsRoutePath) {
      // setting screen
      appState.selectedIndex = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: this.navigatorKey,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (appState.selectedListing != null) {
          appState.selectedListing = null;
        }
        notifyListeners();
        return true;
      },
      pages: [
        MaterialPage(
          child: AppShell(navigationState: appState), // appShell
        ),
      ],
    );
  }

  @override
  AppRoutePath? get currentConfiguration {
    if (appState.selectedIndex == 1) {
      return SettingsRoutePath();
    } else {
      if (appState.selectedListing == null) {
        return ListingsRoutePath();
      } else {
        return ListingRoutePath(appState.getSelectedListingById());
      }
    }
  }
}
