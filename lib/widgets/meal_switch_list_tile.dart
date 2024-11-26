import 'package:flutter/material.dart';

class MealSwitchListTile extends StatefulWidget {
  MealSwitchListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onToggleValue,
    required this.isChecked,
  });

  void Function(bool) onToggleValue;
  bool isChecked;
  final String title;
  final String subtitle;

  @override
  State<MealSwitchListTile> createState() => _MealSwitchListTileState();
}

class _MealSwitchListTileState extends State<MealSwitchListTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.isChecked,
      onChanged: widget.onToggleValue,
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
