import 'router_cubit.dart';

class ListingRouteState extends RouteState {
  const ListingRouteState(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
