import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/models/listing.dart';
import 'package:flutter_navigation_part_2/screens/items_flow.dart';

import '../state/navigation_state.dart';

class ListingPage extends StatelessWidget {
  final Listing listing;
  final NavigationState navigationState;

  const ListingPage(
      {required this.listing, super.key, required this.navigationState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //todo
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          this.listing.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: ItemsFlow(navigationState: navigationState),
    );
  }
}
