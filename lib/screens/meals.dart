import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final Function(Meal meal) onToggleFavorite;

  void onSelectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctxt) => MealDetails(
        meal: meal,
        onToggleFavorite: onToggleFavorite,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return content(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    if (meals.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(height: 16),
            Text('Try selecting a different category',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    )),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectedMeal: () {
            onSelectedMeal(context, meals[index]);
          },
        ),
      );
    }
  }
}
