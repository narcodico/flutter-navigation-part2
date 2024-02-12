import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_part_2/listings/cubit/listings_cubit.dart';
import 'package:flutter_navigation_part_2/models/listing.dart';
import 'package:flutter_navigation_part_2/models/status.dart';

class ListingsPage extends StatelessWidget {
  const ListingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listings'),
      ),
      body: Center(
        child: BlocBuilder<ListingsCubit, ListingsState>(
          builder: (context, state) {
            return switch (state.status) {
              Status.loaded => Listings(
                  listings: state.listings,
                  onTap: (listing) => context
                      .read<ListingsCubit>()
                      .changeSelectedListing(listing),
                ),
              _ => CircularProgressIndicator(),
            };
          },
        ),
      ),
    );
  }
}

class Listings extends StatelessWidget {
  final List<Listing> listings;
  final ValueChanged<Listing> onTap;

  Listings({
    required this.listings,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final listing in listings)
          ListTile(
            title: Text(listing.name),
            subtitle: Text(listing.category),
            onTap: () => onTap(listing),
          )
      ],
    );
  }
}
