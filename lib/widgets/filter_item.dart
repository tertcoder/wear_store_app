import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem(
      {super.key,
      required this.label,
      this.isActive = false,
      required this.onPressed});

  final String label;
  final bool isActive;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // tapTargetSize: MaterialTapTargetSize.shrinkWrap,

        minimumSize: Size.zero,
        backgroundColor: isActive
            ? Theme.of(context).colorScheme.secondaryContainer
            : Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontSize: 14,
        ),
      ),
    );
  }
}
