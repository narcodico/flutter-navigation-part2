import 'package:equatable/equatable.dart';

class Listing extends Equatable {
  const Listing({
    required this.name,
    required this.category,
  });

  final String name;
  final String category;

  static const empty = Listing(category: '', name: '');

  @override
  List<Object?> get props => [name, category];
}

extension ListingX on Listing {
  bool get isEmpty => this == Listing.empty;
  bool get isNotEmpty => !isEmpty;
}

final List<Listing> kListings = [
  Listing(
    name: 'Pumpkin Cake',
    category: 'recipes',
  ),
  Listing(
    name: "Grandma's Chocolate Texas Sheet Cake",
    category: 'cake',
  ),
  Listing(
    name: 'Apple Upside-Down cake',
    category: 'desserts',
  ),
  Listing(
    name: 'Maple Buttercream Frosting',
    category: 'frosting',
  ),
];
