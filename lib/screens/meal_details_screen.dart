import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';
import '../widgets/meal_item_attributes.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  String get complexityText{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }
  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
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
      ),
      body: Column(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          Container(
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
          ),
          Container(
            color: Colors.black54,
            height: 50,
            width: double.infinity,
            //padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MealItemAttributes(
                    icon: Icons.schedule,
                    label: "${meal.duration}min"
                ),
                const SizedBox(
                  width: 15,
                ),
                MealItemAttributes(
                  icon: Icons.work,
                  label: complexityText,
                ),
                const SizedBox(
                  width: 15,
                ),
                MealItemAttributes(
                  icon: Icons.attach_money,
                  label: affordabilityText,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
