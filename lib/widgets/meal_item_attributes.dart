import 'package:flutter/material.dart';

class MealItemAttributes extends StatelessWidget {
  const MealItemAttributes({Key? key, required this.icon, required this.label})
      : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(label, style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),),
      ],
    );
  }
}
