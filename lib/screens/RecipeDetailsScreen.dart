import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/models/recipe_model.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({required this.recipe, super.key});

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
            ...[
              Text(this.recipe.name,
                  style: Theme.of(context).textTheme.headlineSmall),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(this.recipe.catagory,
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(this.recipe.chef,
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
