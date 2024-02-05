import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/models/listing.dart';

class ListingsPage extends StatelessWidget {
  final List<Listing> listings;
  final ValueChanged<Listing> onTap;

  ListingsPage({
    required this.listings,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listings'),
      ),
      body: ListView(
        children: [
          for (var listing in this.listings)
            ListTile(
              title: Text(listing.name),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(listing.catagory),
                  Text(listing.chef),
                ],
              ),
              onTap: () => onTap(listing),
            )
        ],
      ),
    );
  }
}
