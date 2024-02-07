import 'package:flutter/material.dart';

import '../models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({required this.item, super.key});

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
      ),
      body: Center(
        child: Text(
          this.item.id,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
