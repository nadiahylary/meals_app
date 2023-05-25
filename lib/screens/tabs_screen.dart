import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/random_data.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/filters.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'meals_screen.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.vegetarian: false,
  Filter.lactoseFree: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  final List<Meal> _favoriteMeals = [];
  int _selectedTabIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectTab(int index){
    setState(() {
      _selectedTabIndex = index;
    });
  }
  void _showInfoMsg(String msg){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }


  void _addOrRemoveFavorite(Meal meal){
    bool isFavorite = _favoriteMeals.contains(meal);
    if(isFavorite){
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMsg("Meal Removed from Favorites");
    }
    else{
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMsg("Meal Added from Favorites");
      });
    }
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if(identifier == "filters"){
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
              builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters,))
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final filteredMeals = meals.where((meal){
      if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();

    Widget activeTab = CategoriesScreen(
      addOrRemoveFavorite: _addOrRemoveFavorite,
      filteredMeals: filteredMeals,
    );
    var activeTabTitle = "Categories";

    if(_selectedTabIndex == 1){
      activeTab = MealsScreen(meals: _favoriteMeals, addOrRemoveFavorite: _addOrRemoveFavorite,);
      activeTabTitle = "Favorite Recipes";
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(activeTabTitle),
      ),
      drawer: MainDrawer(onTapDrawerMenu: _setScreen,),
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
