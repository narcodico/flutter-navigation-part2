import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_navigation_part_2/models/listing.dart';
import 'package:flutter_navigation_part_2/models/status.dart';

part 'listings_state.dart';

class ListingsCubit extends Cubit<ListingsState> {
  ListingsCubit() : super(const ListingsState()) {
    getListings();
  }

  Future<void> getListings() async {
    emit(state.copyWith(status: Status.loading));
    await Future.delayed(Duration(seconds: 1));
    emit(state.copyWith(
      status: Status.loaded,
      listings: kListings,
    ));
  }

  void changeSelectedListing(Listing listing) {
    emit(state.copyWith(selectedListing: listing));
  }
}
