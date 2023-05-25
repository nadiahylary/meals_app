import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/screens/filters.dart';

import '../models/meal.dart';
import '../providers/filters_provider.dart';
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
  int _selectedTabIndex = 0;

  void _selectTab(int index){
    setState(() {
      _selectedTabIndex = index;
    });
  }


  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if(identifier == "filters"){
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
              builder: (ctx) => const FiltersScreen())
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealsProvider);

    Widget activeTab = CategoriesScreen(
      filteredMeals: filteredMeals,
    );
    var activeTabTitle = "Categories";

    if(_selectedTabIndex == 1){
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activeTab = MealsScreen(
        meals: favoriteMeals,
      );
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
