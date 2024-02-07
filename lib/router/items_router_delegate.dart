import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/router/app_route_path.dart';
import 'package:flutter_navigation_part_2/state/navigation_state.dart';

import '../screens/item_page.dart';
import '../screens/items_page.dart';

class ItemsRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  NavigationState _navigationState;

  NavigationState get navigationState => _navigationState;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  set navigationState(NavigationState newState) {
    if (newState == _navigationState) {
      return;
    }
    _navigationState = newState;
    notifyListeners();
  }

  ItemsRouterDelegate(this._navigationState);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: this.navigatorKey,
      pages: [
        MaterialPage(
          child: ItemsPage(
            onTap: (item) {
              navigationState.selectedItem = item;
              notifyListeners();
            },
          ),
          // name: '/listings',
        ),
        if (navigationState.selectedItem != null)
          MaterialPage(
            key: ValueKey(navigationState.selectedItem!),
            child: ItemPage(
              item: navigationState.selectedItem!,
            ),
            // name: '/listings/${appState.selectedListing!.name}',
          )
      ],
      onPopPage: (route, result) {
        navigationState.selectedItem = null;
        notifyListeners();
        return route.didPop(result);
      },
    );
  }

  // @override
  // AppRoutePath? get currentConfiguration {
  //   print('items currentConfiguration $currentConfiguration');
  //   if (navigationState.selectedItem != null) {
  //     return ItemRoutePath(navigationState.getSelectedListingById(),
  //         navigationState.selectedItem!.id);
  //   } else {
  //     return ItemsRoutePath(navigationState.getSelectedListingById());
  //   }
  // }

  @override
  Future<void> setNewRoutePath(AppRoutePath config) async {
    log('items: $config');
  }
}
