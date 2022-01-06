import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';

class ReceipesGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;

  const ReceipesGridView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400),
        itemBuilder: (context, index) {
          final simpleRecipe = recipes[index];
          return ReceipeThumbnail(recipe: simpleRecipe);
        },
      ),
    );
  }
}
