import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/state/navigation_state.dart';

import '../router/items_router_delegate.dart';

class ItemsFlow extends StatefulWidget {
  final NavigationState navigationState;

  const ItemsFlow({required this.navigationState});

  @override
  _ItemsFlowState createState() => _ItemsFlowState();
}

class _ItemsFlowState extends State<ItemsFlow> {
  late final ItemsRouterDelegate _itemsRouteDelegate;
  late final ChildBackButtonDispatcher _backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    _itemsRouteDelegate = ItemsRouterDelegate(widget.navigationState);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _backButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher();
  }

  @override
  void didUpdateWidget(covariant ItemsFlow oldWidget) {
    super.didUpdateWidget(oldWidget);
    _itemsRouteDelegate.navigationState = widget.navigationState;
  }

  @override
  Widget build(BuildContext context) {
    return Router(
      routerDelegate: _itemsRouteDelegate,
      backButtonDispatcher: _backButtonDispatcher,
    );
  }
}
