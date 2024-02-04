import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/router/listings_router_delegate.dart';
import 'package:flutter_navigation_part_2/state/navigation_state.dart';

class AppShell extends StatefulWidget {
  final NavigationState navigationState;

  AppShell({required this.navigationState});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppShell> {
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
  void didUpdateWidget(covariant AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    _listingsRouteDelegate.appState = widget.navigationState;
  }

  @override
  Widget build(BuildContext context) {
    var navigationState = widget.navigationState;
    return Scaffold(
      body: Router(
        routerDelegate: _listingsRouteDelegate,
        backButtonDispatcher: _backButtonDispatcher,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: navigationState.selectedIndex,
        onTap: (inx) {
          navigationState.selectedIndex = inx;
        },
      ),
    );
  }
}
