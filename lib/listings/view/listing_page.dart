import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/models/listing.dart';

class ListingPage extends StatelessWidget {
  const ListingPage({required this.listing, super.key});

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // todo
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        title: Text(
          this.listing.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      // todo
      // body: ItemsFlow(),
    );
  }
}
