import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = filteredMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                bool wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                _showInfoMessage(context,
                    wasAdded ? 'Meal added as favorite' : 'Meal removed.');
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween(begin: 0.8, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavorite),
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 10),
            _titleWidget(context, 'Ingredients'),
            const SizedBox(height: 14),
            _listWidget(context, meal.ingredients),
            const SizedBox(height: 24),
            _titleWidget(context, 'Steps'),
            const SizedBox(height: 14),
            _listWidget(context, meal.steps,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                )),
          ],
        ),
      ),
    );
  }

  void _showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _titleWidget(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _listWidget(BuildContext context, List<String> elements,
      {EdgeInsets padding = EdgeInsets.zero}) {
    return Column(
      children: elements
          .map((element) => Padding(
                padding: padding,
                child: Text(
                  element,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ))
          .toList(),
    );
  }
}
