import 'package:flutter/material.dart';

import '../data/random_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import 'meal_details_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({Key? key, this.title, required this.meals, required this.addOrRemoveFavorite}) : super(key: key);

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) addOrRemoveFavorite;

  void _selectedMeal(BuildContext context, Meal chosenMeal) {
    final mealDetail = availableMeals.where((meal) => meal.title == chosenMeal.title).first;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealDetailsScreen(meal: mealDetail, addOrRemoveFavorite: addOrRemoveFavorite,)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(itemBuilder: (ctx, index){
      return MealItem(meal: meals[index], onSelectMeal: (){
        _selectedMeal(context, meals[index]);
      }
      );
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
                color: Theme.of(context).colorScheme.onPrimaryContainer,
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
    if(title == null){
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
