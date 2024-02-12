import 'dart:developer';

import 'package:flutter/material.dart';

import '../screens/items_page.dart';
import 'cubit/router_cubit.dart';

class ItemsRouterDelegate extends RouterDelegate<RouteState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: this.navigatorKey,
      pages: [
        MaterialPage(
          child: ItemsPage(
            onTap: (item) {
              //todo
              // navigationState.selectedItem = item;
              // notifyListeners();
            },
          ),
          // name: '/listings',
        ),
        //todo
        // if (navigationState.selectedItem != null)
        //   MaterialPage(
        //     key: ValueKey(navigationState.selectedItem!),
        //     child: ItemPage(
        //       item: navigationState.selectedItem!,
        //     ),
        //     // name: '/listings/${appState.selectedListing!.name}',
        //   )
      ],
      onPopPage: (route, result) {
        // todo
        // navigationState.selectedItem = null;
        // notifyListeners();
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
  Future<void> setNewRoutePath(RouteState config) async {
    log('items: $config');
  }
}
