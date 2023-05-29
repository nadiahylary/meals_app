import 'package:flutter/material.dart';
import 'package:meals_app/data/random_data.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../models/category.dart';
import '../models/meal.dart';
import 'meals_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key, required this.filteredMeals}) : super(key: key);
  final List<Meal> filteredMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final mealsByCategory = widget.filteredMeals.where((meal) => meal.categories.contains(category.id)).toList();
    //OR: Navigator.of(context).push(route);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                title: category.title, meals: mealsByCategory)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
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
          ],
        ),
        builder: (context, child) => SlideTransition(
            position:  Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)),
          child: child,
        ),
        /* OR
        builder: (context, child) => Padding(
          padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
          child: child,
        )*/
    );
  }
}
