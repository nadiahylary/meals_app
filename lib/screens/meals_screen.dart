import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({Key? key, required this.categoryTitle, required this.meals}) : super(key: key);

  final String categoryTitle;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(itemBuilder: (ctx, index){
      return MealItem(meal: meals[index]);
    },
      itemCount: meals.length,);

    if(meals.isEmpty){
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 200,
              margin: const EdgeInsets.only(top: 30),
              child: Image.asset(
                "assets/images/empty_plate.jfif",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "uh oh...No meals here yet!.",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Try Selecting a different category",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: content,
    );
  }
}
