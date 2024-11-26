import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/widgets/meal_switch_list_tile.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          MealSwitchListTile(
            onToggleValue: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, value);
            },
            isChecked: filters[Filter.glutenFree]!,
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
          ),
          MealSwitchListTile(
              onToggleValue: (value) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactoseFree, value);
              },
              isChecked: filters[Filter.lactoseFree]!,
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.'),
          MealSwitchListTile(
              onToggleValue: (value) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegetarian, value);
              },
              isChecked: filters[Filter.vegetarian]!,
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.'),
          MealSwitchListTile(
              onToggleValue: (value) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, value);
              },
              isChecked: filters[Filter.vegan]!,
              title: 'Vegan',
              subtitle: 'Only include vegan meals.'),
        ],
      ),
    );
  }
}
