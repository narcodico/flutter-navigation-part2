part of 'listings_cubit.dart';

class ListingsState extends Equatable {
  const ListingsState({
    this.status = Status.initial,
    this.listings = const [],
    this.selectedListing = Listing.empty,
  });

  final Status status;
  final List<Listing> listings;
  final Listing selectedListing;

  @override
  List<Object?> get props => [status, listings, selectedListing];

  ListingsState copyWith({
    Status? status,
    List<Listing>? listings,
    Listing? selectedListing,
  }) {
    return ListingsState(
      status: status ?? this.status,
      listings: listings ?? this.listings,
      selectedListing: selectedListing ?? this.selectedListing,
    );
  }
}
