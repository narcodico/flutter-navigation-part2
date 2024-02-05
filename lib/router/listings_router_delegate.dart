import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/router/app_route_path.dart';
import 'package:flutter_navigation_part_2/screens/listing_page.dart';
import 'package:flutter_navigation_part_2/screens/listings_page.dart';
import 'package:flutter_navigation_part_2/state/navigation_state.dart';

import 'listing_route_path.dart';
import 'listings_route_path.dart';

class ListingsRouterDelegate extends RouterDelegate<AppRoutePath>
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
            key: ValueKey(navigationState.selectedListing),
            child: ListingPage(listing: navigationState.selectedListing!),
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

  @override
  Future<void> setNewRoutePath(AppRoutePath config) async {
    log('listings: $config');
    if (config is ListingsRoutePath) {
      navigationState.selectedListing = null;
    } else if (config is ListingRoutePath) {
      navigationState.setSelectedListingById(config.id);
    }
  }
}
