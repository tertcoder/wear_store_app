import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({super.key, required this.quantity, required this.label});
  final String quantity;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          quantity,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 48,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
