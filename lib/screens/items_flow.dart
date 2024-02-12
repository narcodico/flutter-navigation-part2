import 'package:flutter/material.dart';

import '../router/items_router_delegate.dart';

class ItemsFlow extends StatefulWidget {
  const ItemsFlow();

  @override
  _ItemsFlowState createState() => _ItemsFlowState();
}

class _ItemsFlowState extends State<ItemsFlow> {
  late final ItemsRouterDelegate _itemsRouteDelegate;
  late final ChildBackButtonDispatcher _backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    _itemsRouteDelegate = ItemsRouterDelegate();
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
    return Router(
      routerDelegate: _itemsRouteDelegate,
      backButtonDispatcher: _backButtonDispatcher,
    );
  }
}
