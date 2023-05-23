import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red[300], //todo note: I found how to customize color shades without using the fromARGB parameter,
      appBar: AppBar(
        title: const Text("Browse by Category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        //todo note: GridView is like a Column widget with multiple rows. So, its crossAxis is the same as a Column widget's crossAxis
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //todo note: number of grids on the horizontal axis, ie crossAxis
          crossAxisCount: 2,
          //todo note: size of a tile in terms of width/height ratio. Eg a childAspectRatio = 1 will give us square tiles(width = height)
          childAspectRatio: 3/3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        children: [
          for(final category in availableCategories)
            CategoryGridItem(category: category),
          //todo other method:
           /*...availableCategories.map((element) {
            return CategoryGridItem(category: element);
          }).toList(),*/
        ],
      ),
    );
  }
}
