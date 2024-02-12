// import 'package:flutter/cupertino.dart';
// import 'package:flutter_navigation_part_2/models/listing.dart';

// import '../models/item.dart';

// class NavigationState extends ChangeNotifier {
//   int _selectedIndex;

//   bool _isAuthenticated;
//   bool get isAuthenticated => _isAuthenticated;
//   set isAuthenticated(bool authenticated) {
//     _isAuthenticated = authenticated;
//     notifyListeners();
//   }

//   final List<Listing> listings = [
//     Listing(name: 'Pumpkin Cake', category: 'Squash recipes', chef: 'Sue Case'),
//     Listing(
//         name: "Grandma's Chocolate Texas Sheet Cake",
//         category: 'Sheet cake',
//         chef: 'Bakah Miller'),
//     Listing(
//         name: 'Apple Upside-Down cake',
//         category: 'Apple desserts',
//         chef: 'Amber'),
//     Listing(
//         name: 'Maple Buttercream Frosting',
//         category: 'Buttercream frosting',
//         chef: 'Sarah'),
//   ];

//   NavigationState()
//       : _selectedIndex = 0,
//         _isAuthenticated = false;

//   int get selectedIndex => _selectedIndex;

//   set selectedIndex(int v) {
//     _selectedIndex = v;
//     notifyListeners();
//   }

//   Listing? get selectedListing => _selectedListing;
//   Listing? _selectedListing;
//   set selectedListing(Listing? value) {
//     _selectedListing = value;
//     notifyListeners();
//   }

//   Item? get selectedItem => _selectedItem;
//   Item? _selectedItem;
//   set selectedItem(Item? value) {
//     _selectedItem = value;
//     notifyListeners();
//   }

//   void setSelectedItemById(String id) {
//     selectedItem = Item(id);
//   }

//   int getSelectedListingById() {
//     if (_selectedListing == null || !listings.contains(_selectedListing)) {
//       return 0;
//     }
//     return listings.indexOf(_selectedListing!);
//   }

//   void setSelectedListingById(int id) {
//     selectedListing = listings[id];
//   }

//   @override
//   String toString() {
//     final listingIndex =
//         selectedListing != null ? listings.indexOf(selectedListing!) : -1;
//     final itemId = selectedItem?.id ?? '-';
//     return 'selectedListing(${listingIndex}), selectedItem(${itemId})';
//   }
// }
