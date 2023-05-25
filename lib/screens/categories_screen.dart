import 'package:flutter/material.dart';
import 'package:meals_app/data/random_data.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../models/category.dart';
import '../models/meal.dart';
import 'meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key, required this.addOrRemoveFavorite, required this.filteredMeals}) : super(key: key);
  final void Function(Meal meal) addOrRemoveFavorite;
  final List<Meal> filteredMeals;

  void _selectCategory(BuildContext context, Category category) {
    final mealsByCategory = filteredMeals.where((meal) => meal.categories.contains(category.id)).toList();
    //OR: Navigator.of(context).push(route);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                title: category.title, meals: mealsByCategory, addOrRemoveFavorite: addOrRemoveFavorite,)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      //backgroundColor: Colors.red[300], //todo note: I found how to customize color shades without using the fromARGB parameter,
      /*Scaffold(
      appBar: AppBar(

        title: const Text("Browse by Category"),
      ),
      body: */
      GridView(
        padding: const EdgeInsets.all(20),
        //todo note: GridView is like a Column widget with multiple rows. So, its crossAxis is the same as a Column widget's crossAxis
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //todo note: number of grids on the horizontal axis, ie crossAxis
          crossAxisCount: 2,
          //todo note: size of a tile in terms of width/height ratio. Eg a childAspectRatio = 1 will give us square tiles(width = height)
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                }),
          //todo other method:
          /*...availableCategories.map((element) {
            return CategoryGridItem(category: element);
          }).toList(),*/
        ],
      );
  }
}
