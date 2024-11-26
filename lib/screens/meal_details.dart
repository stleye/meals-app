import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends StatelessWidget {
  const MealDetails(
      {super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavorite(meal);
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
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
