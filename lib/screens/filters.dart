import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';



class FiltersScreen extends ConsumerWidget{
  const FiltersScreen({Key? key}) : super(key: key);


 /* @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {

  var _glutenFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _veganFilterSet = activeFilters[Filter.vegan]!;
  }
*/

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final filters = ref.watch(filtersProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      /*drawer: MainDrawer(
        onTapDrawerMenu: (identifier){
          Navigator.of(context).pop();
          if(identifier == "meals"){
            //this makes the new screen is not pushed onto the stack of screens but instead
            // making the current active screen been replaced by the new one.
            // And therefore the device back button would not work because there is no where to go back to, so it instead closes the app.
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (ctx) => const TabsScreen())
            );
          }
        },
      ),*/
      /*WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegan: _veganFilterSet
          });
          return true;
        },
        child:*/
      body:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SwitchListTile(
                value: filters[Filter.glutenFree]!,
                onChanged: (isChecked){
                  ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
                },
              title: Text("Gluten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,),
              ),
              subtitle: Text("Only include gluten-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: filters[Filter.vegetarian]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
                },
              title: Text("Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,),
              ),
              subtitle: Text("Only include vegetarian meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: filters[Filter.lactoseFree]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text("Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,),
              ),
              subtitle: Text("Only include lactose-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: filters[Filter.vegan]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
              title: Text("Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,),
              ),
              subtitle: Text("Only include vegan meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      );
  }
}
