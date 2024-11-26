import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_switch_list_tile.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.activeFilters});

  final Map<Filter, bool> activeFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilter = false;
  var _lactoseFreeFilter = false;
  var _vegetarianFreeFilter = false;
  var _veganFreeFilter = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilter = widget.activeFilters[Filter.lactoseFree]!;
    _vegetarianFreeFilter = widget.activeFilters[Filter.vegetarian]!;
    _veganFreeFilter = widget.activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegetarian: _vegetarianFreeFilter,
            Filter.vegan: _veganFreeFilter
          });
        },
        child: Column(
          children: [
            MealSwitchListTile(
              onToggleValue: (value) {
                setState(() {
                  _glutenFreeFilter = value;
                });
              },
              isChecked: _glutenFreeFilter,
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
            ),
            MealSwitchListTile(
                onToggleValue: (value) {
                  setState(() {
                    _lactoseFreeFilter = value;
                  });
                },
                isChecked: _lactoseFreeFilter,
                title: 'Lactose-free',
                subtitle: 'Only include lactose-free meals.'),
            MealSwitchListTile(
                onToggleValue: (value) {
                  setState(() {
                    _vegetarianFreeFilter = value;
                  });
                },
                isChecked: _vegetarianFreeFilter,
                title: 'Vegetarian',
                subtitle: 'Only include vegetarian meals.'),
            MealSwitchListTile(
                onToggleValue: (value) {
                  setState(() {
                    _veganFreeFilter = value;
                  });
                },
                isChecked: _veganFreeFilter,
                title: 'Vegan',
                subtitle: 'Only include vegan meals.'),
          ],
        ),
      ),
    );
  }
}
