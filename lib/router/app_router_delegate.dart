import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_part_2/screens/app_shell.dart';
import 'package:flutter_navigation_part_2/screens/studio_flow.dart';

import '../app/app.dart';
import '../listings/listings.dart';
import 'cubit/router_cubit.dart';

class AppRouterDelegate extends RouterDelegate<RouteState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteState> {
  AppRouterDelegate({required RouterCubit routerCubit})
      : _routerCubit = routerCubit;

  final RouterCubit _routerCubit;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(RouteState configuration) {
    log('setNewRoutePath: $configuration');
    return SynchronousFuture(_routerCubit.update((_) => configuration));
    // if (config is ListingsRouteState) {
    //   navigationState.selectedListing = null;
    //   navigationState.selectedItem = null;
    // } else if (config is ListingRouteState) {
    //   navigationState.setSelectedListingById(config.id);
    //   navigationState.selectedItem = null;
    // } else if (config is ItemRouteState) {
    //   navigationState.setSelectedListingById(config.id);
    //   navigationState.setSelectedItemById(config.itemId);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: BlocListener<RouterCubit, RouteState>(
        listener: (_, __) => notifyListeners(),
        child: BlocSelector<AppCubit, AppState, bool>(
          selector: (state) => state.isAuthenticated,
          builder: (context, isUserAuthenticated) {
            return Navigator(
              key: this.navigatorKey,
              onPopPage: (route, result) {
                return route.didPop(result);
                // if (!route.didPop(result)) {
                //   return false;
                // }
                // // todo
                // // if (navigationState.selectedListing != null) {
                // //   navigationState.selectedListing = null;
                // // }
                // // notifyListeners();
                // return true;
              },
              pages: [
                if (isUserAuthenticated)
                  StudioFlow.page()
                else
                  ListingsFlow.page(),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  RouteState? get currentConfiguration {
    return _routerCubit.state;
    // if (navigationState.selectedIndex == 1) {
    //   routeState = SettingsRouteState();
    // } else if (navigationState.selectedListing == null) {
    //   routeState = ListingsRouteState();
    // } else if (navigationState.selectedListing != null &&
    //     navigationState.selectedItem == null) {
    //   routeState = ListingRouteState(navigationState.getSelectedListingById());
    // } else if (navigationState.selectedListing != null &&
    //     navigationState.selectedItem != null) {
    //   routeState = ItemRouteState(
    //     navigationState.getSelectedListingById(),
    //     navigationState.selectedItem!.id,
    //   );
    // } else {
    //   routeState = null;
    // }
    // log('app currentConfiguration: $routeState');
    // log('app currentConfiguration state: $navigationState');
  }
}
