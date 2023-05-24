import 'package:flutter/material.dart';
import 'package:meals_app/data/random_data.dart';

import '../models/meal.dart';
import 'categories_screen.dart';
import 'meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Meal> favoriteMeals = [];

  int _selectedTabIndex = 0;

  void _selectTab(int index){
    setState(() {
      _selectedTabIndex = index;
    });
  }


  void _addOrRemoveFavorite(Meal meal){
    bool isFavorite = favoriteMeals.contains(meal);
    setState(() {
      if(isFavorite){
        favoriteMeals.remove(meal);
      }
      favoriteMeals.add(meal);

    });

  }

  @override
  Widget build(BuildContext context) {

    Widget activeTab = CategoriesScreen(addOrRemoveFavorite: _addOrRemoveFavorite,);
    var activeTabTitle = "Categories";

    if(_selectedTabIndex == 1){
      activeTab = MealsScreen(meals: favoriteMeals, addOrRemoveFavorite: _addOrRemoveFavorite,);
      activeTabTitle = "Favorite Recipes";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeTabTitle),
      ),
      body: activeTab,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        currentIndex: _selectedTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: "Favorites",),
        ],
      ),
    );
  }
}
