import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("Nenhuma refeicao marcada"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meal: favoriteMeals[index]);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
