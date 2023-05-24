import 'package:flutter/material.dart';
import 'package:meals_app/data/random_data.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';
import '../widgets/meal_item_attributes.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key, required this.meal, required this.addOrRemoveFavorite}) : super(key: key);

  final Meal meal;
  final void Function(Meal meal) addOrRemoveFavorite;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            IconButton(
                onPressed: (){
                  addOrRemoveFavorite(meal);
                  },
                icon: const Icon(
                  Icons.star_border,
                )
              )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
              /*Container(
                color: Colors.black54,
                height: 38,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: double.infinity,
                child: Text(meal.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 20,
                ),)
            ),*/
              Container(
                color: Colors.black54,
                height: 60,
                width: double.infinity,
                //padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                //padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          MealItemAttributes(
                              icon: Icons.schedule,
                              label: "${meal.duration}min"
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          MealItemAttributes(
                            icon: Icons.work,
                            label: complexityText,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          MealItemAttributes(
                            icon: Icons.attach_money,
                            label: affordabilityText,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          MealItemAttributes(
                            icon: Icons.shopping_basket,
                            label: "${meal.ingredients.length} Ingredients",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_basket,
                    size: 35,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Ingredients",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              for(final ingredient in meal.ingredients)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.crop_square,
                        size: 15,
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(ingredient,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                          ),),
                      )
                    ],
                  ),
                ),
              const SizedBox(
                height: 15,
              ),
              const Divider(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_basket,
                    size: 35,
                    color: Theme.of(context).colorScheme.primary,
                  ),
              const SizedBox(
                width: 10,
              ),
              Text("Steps",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          for(final step in meal.steps)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.crop_square,
                      size: 15,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(step,
                            //overflow: TextOverflow.clip,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                          ),),
                      ),
                    )
                  ],
              ),
            )

    ]
    ,
    ),
        )
    ,
    );
  }
}
