import 'router_cubit.dart';

class ItemRouteState extends RouteState {
  const ItemRouteState(this.id, this.itemId);

  final int id;
  final String itemId;

  @override
  List<Object> get props => [id, itemId];
}
