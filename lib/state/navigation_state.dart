import 'package:flutter/cupertino.dart';
import 'package:flutter_navigation_part_2/models/listing.dart';

class NavigationState extends ChangeNotifier {
  int _selectedIndex;
  Listing? _selectedListing;

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

  NavigationState() : _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int v) {
    _selectedIndex = v;
    if (_selectedIndex == 1) {
      _selectedListing = null;
    }
    notifyListeners();
  }

  set selectedRecipe(Listing? value) {
    _selectedListing = value;
    notifyListeners();
  }

  Listing? get selectedRecipe => _selectedListing;

  int getSelectedRecipeById() {
    if (_selectedListing == null || !listings.contains(_selectedListing))
      return 0;
    return listings.indexOf(_selectedListing!);
  }

  void setSelectedRecipeById(int id) {
    if (id < 0 || id > listings.length - 1) {
      return;
    }
    _selectedListing = listings[id];
    notifyListeners();
  }
}
