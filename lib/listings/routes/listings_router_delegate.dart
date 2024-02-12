import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_part_2/listings/cubit/listings_cubit.dart';
import 'package:flutter_navigation_part_2/listings/view/listings_page.dart';
import 'package:flutter_navigation_part_2/models/listing.dart';

import '../../router/cubit/router_cubit.dart';
import '../view/listing_page.dart';

class ListingsRouterDelegate extends RouterDelegate<RouteState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RouterCubit, RouteState>(
      // todo: need?
      listener: (_, __) => notifyListeners(),
      child: BlocBuilder<ListingsCubit, ListingsState>(
        builder: (context, state) {
          final selectedListing = state.selectedListing;
          return Navigator(
            key: navigatorKey,
            pages: [
              MaterialPage(
                child: const ListingsPage(),
                // name: '/listings',
              ),
              if (selectedListing.isNotEmpty)
                MaterialPage(
                  key: ValueKey(selectedListing.name),
                  child: ListingPage(listing: selectedListing),
                  // name: '/listings/${appState.selectedListing!.name}',
                )
            ],
            onPopPage: (route, result) {
              context
                  .read<ListingsCubit>()
                  .changeSelectedListing(Listing.empty);
              return route.didPop(result);
            },
          );
        },
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(RouteState config) => SynchronousFuture(null);
}
