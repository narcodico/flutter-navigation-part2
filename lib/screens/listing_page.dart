import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/models/listing.dart';

class ListingPage extends StatelessWidget {
  final Listing listing;

  const ListingPage({required this.listing, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.listing.name,
                style: Theme.of(context).textTheme.headlineSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(this.listing.catagory,
                    style: Theme.of(context).textTheme.titleMedium),
                Text(this.listing.chef,
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
