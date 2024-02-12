import 'listing_route_state.dart';

class ItemRouteState extends ListingRouteState {
  const ItemRouteState(super.id, this.itemId);

  final String itemId;

  @override
  List<Object> get props => [itemId];
}
