import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_part_2/listings/cubit/listings_cubit.dart';
import 'package:flutter_navigation_part_2/listings/routes/listings_router_delegate.dart';
import 'package:flutter_navigation_part_2/models/listing.dart';
import 'package:flutter_navigation_part_2/router/cubit/listing_route_state.dart';
import 'package:flutter_navigation_part_2/router/cubit/listings_route_state.dart';
import 'package:flutter_navigation_part_2/router/cubit/router_cubit.dart';

class ListingsFlow extends StatefulWidget {
  const ListingsFlow._();

  static MaterialPage<void> page() => MaterialPage(
        key: ValueKey('listings-flow'),
        child: ListingsFlow._(),
      );

  @override
  _ListingsFlowState createState() => _ListingsFlowState();
}

class _ListingsFlowState extends State<ListingsFlow> {
  late final ListingsRouterDelegate _listingsRouteDelegate;
  late final ChildBackButtonDispatcher _backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    _listingsRouteDelegate = ListingsRouterDelegate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _backButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListingsCubit(),
      child: BlocListener<ListingsCubit, ListingsState>(
        listenWhen: (previous, current) =>
            previous.selectedListing != current.selectedListing,
        listener: (context, state) {
          final selectedListing = state.selectedListing;
          context.read<RouterCubit>().update((_) =>
              state.selectedListing.isEmpty
                  ? ListingsRouteState()
                  : ListingRouteState(kListings.indexOf(selectedListing)));
        },
        child: Scaffold(
          body: Router(
            routerDelegate: _listingsRouteDelegate,
            backButtonDispatcher: _backButtonDispatcher,
          ),
        ),
      ),
    );
  }
}
