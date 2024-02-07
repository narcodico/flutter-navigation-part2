import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/models/item.dart';

class ItemsPage extends StatelessWidget {
  final ValueChanged<Item> onTap;

  ItemsPage({
    required this.onTap,
  });

  static const items = [
    Item('item1'),
    Item('item2'),
    Item('item3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listings'),
      ),
      body: ListView(
        children: [
          for (var item in items)
            ListTile(
              title: Text(item.id),
              onTap: () => onTap(item),
            )
        ],
      ),
    );
  }
}
