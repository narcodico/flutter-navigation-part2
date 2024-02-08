import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'listings_route_state.dart';

part 'route_state.dart';

typedef RouterCallback<T> = T Function(T state);

class RouterCubit extends Cubit<RouteState> {
  // this looks promising, given we could inject user repo and set dynamic
  // initial state to listingsPath or studioPath based on user role...
  RouterCubit() : super(const ListingsRouteState());

  void update(RouterCallback<RouteState> callback) {
    emit(callback(state));
  }
}
