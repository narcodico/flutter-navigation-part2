import 'package:flutter/cupertino.dart';
import 'package:flutter_navigation_part_2/models/listing.dart';

class NavigationState extends ChangeNotifier {
  int _selectedIndex;
  Listing? _selectedListing;

  bool _isAuthenticated;
  bool get isAuthenticated => _isAuthenticated;
  set isAuthenticated(bool authenticated) {
    _isAuthenticated = authenticated;
    notifyListeners();
  }

  final List<Listing> listings = [
    Listing(name: 'Pumpkin Cake', catagory: 'Squash recipes', chef: 'Sue Case'),
    Listing(
        name: "Grandma's Chocolate Texas Sheet Cake",
        catagory: 'Sheet cake',
        chef: 'Bakah Miller'),
    Listing(
        name: 'Apple Upside-Down cake',
        catagory: 'Apple desserts',
        chef: 'Amber'),
    Listing(
        name: 'Maple Buttercream Frosting',
        catagory: 'Buttercream frosting',
        chef: 'Sarah'),
  ];

  NavigationState()
      : _selectedIndex = 0,
        _isAuthenticated = false;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int v) {
    _selectedIndex = v;
    notifyListeners();
  }

  set selectedListing(Listing? value) {
    _selectedListing = value;
    notifyListeners();
  }

  Listing? get selectedListing => _selectedListing;

  int getSelectedListingById() {
    if (_selectedListing == null || !listings.contains(_selectedListing))
      return 0;
    return listings.indexOf(_selectedListing!);
  }

  void setSelectedListingById(int id) {
    if (id < 0 || id > listings.length - 1) {
      return;
    }
    _selectedListing = listings[id];
    notifyListeners();
  }
}
