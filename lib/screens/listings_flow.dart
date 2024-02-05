import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/router/listings_router_delegate.dart';
import 'package:flutter_navigation_part_2/state/navigation_state.dart';

class ListingsFlow extends StatefulWidget {
  final NavigationState navigationState;

  const ListingsFlow({required this.navigationState});

  static MaterialPage<void> page({required NavigationState navigationState}) =>
      MaterialPage(
        key: ValueKey('listings-flow'),
        child: ListingsFlow(navigationState: navigationState),
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
    _listingsRouteDelegate = ListingsRouterDelegate(widget.navigationState);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _backButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher();
  }

  @override
  void didUpdateWidget(covariant ListingsFlow oldWidget) {
    super.didUpdateWidget(oldWidget);
    _listingsRouteDelegate.navigationState = widget.navigationState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Router(
        routerDelegate: _listingsRouteDelegate,
        backButtonDispatcher: _backButtonDispatcher,
      ),
    );
  }
}
