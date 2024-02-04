import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/router/app_route_path.dart';
import 'package:flutter_navigation_part_2/screens/listing_page.dart';
import 'package:flutter_navigation_part_2/screens/listings_page.dart';
import 'package:flutter_navigation_part_2/screens/settings_page.dart';
import 'package:flutter_navigation_part_2/state/navigation_state.dart';

class ListingsRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  NavigationState _appState;

  NavigationState get appState => _appState;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  set appState(NavigationState newState) {
    if (newState == _appState) {
      return;
    }
    _appState = newState;
    notifyListeners();
  }

  ListingsRouterDelegate(this._appState);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (appState.selectedIndex == 0) ...[
          MaterialPage(
            child: ListingsPage(
              listings: appState.listings,
              onTap: (recipe) {
                appState.selectedRecipe = recipe;
                notifyListeners();
              },
            ),
            name: '/home',
          ),
          if (appState.selectedRecipe != null)
            MaterialPage(
              key: ValueKey(appState.selectedRecipe),
              child: ListingPage(listing: appState.selectedRecipe!),
              name: '/recipe/${appState.selectedRecipe!.name}',
            )
        ] else
          MaterialPage(
            child: SettingsPage(),
            key: ValueKey('Setting'),
            name: '/settings',
          )
      ],
      onPopPage: (route, result) {
        appState.selectedRecipe = null;
        notifyListeners();
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath config) async {}
}
