import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({Key? key, required this.categoryTitle, required this.meals}) : super(key: key);

  final String categoryTitle;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(itemBuilder: (ctx, index){
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 100,
                width: 80,
                child: Image.asset(meals[index].imageUrl)
              //(meals[index].imageUrl, fit: BoxFit.cover,)
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(meals[index].title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                        "Level: ${meals[index].complexity.name}",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text("${meals[index].ingredients.length} Ingredients",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Duration: ${meals[index].duration}min",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                )
              ],
            )
          ],
        ),
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
