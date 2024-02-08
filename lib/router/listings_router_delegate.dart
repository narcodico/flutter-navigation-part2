import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/screens/listing_page.dart';
import 'package:flutter_navigation_part_2/screens/listings_page.dart';
import 'package:flutter_navigation_part_2/state/navigation_state.dart';

import 'cubit/router_cubit.dart';

class ListingsRouterDelegate extends RouterDelegate<RouteState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteState> {
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

  ListingsRouterDelegate(this._navigationState);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: this.navigatorKey,
      pages: [
        MaterialPage(
          child: ListingsPage(
            listings: navigationState.listings,
            onTap: (listing) {
              navigationState.selectedListing = listing;
              notifyListeners();
            },
          ),
          // name: '/listings',
        ),
        if (navigationState.selectedListing != null)
          MaterialPage(
            key: ValueKey(navigationState.selectedListing!),
            child: ListingPage(
              listing: navigationState.selectedListing!,
              navigationState: navigationState,
            ),
            // name: '/listings/${appState.selectedListing!.name}',
          )
      ],
      onPopPage: (route, result) {
        navigationState.selectedListing = null;
        notifyListeners();
        return route.didPop(result);
      },
    );
  }

  // @override
  // AppRoutePath? get currentConfiguration {
  //   print('listings currentConfiguration $currentConfiguration');
  //   if (navigationState.selectedListing != null) {
  //     return ListingRoutePath(navigationState.getSelectedListingById());
  //   } else {
  //     return ListingsRoutePath();
  //   }
  // }

  @override
  Future<void> setNewRoutePath(RouteState config) async {}
}
