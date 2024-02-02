import 'package:flutter/material.dart';
import 'package:wear_store_app/widgets/activity_item.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadowMain(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 18,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(color: Theme.of(context).colorScheme.outline),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActivityItem(quantity: "03", label: "in Cart"),
            ActivityItem(quantity: "12", label: "in Wishlist"),
            ActivityItem(quantity: "00", label: "already bought"),
          ],
        ),
      ),
    );
  }
}
