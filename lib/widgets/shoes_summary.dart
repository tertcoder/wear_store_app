import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wear_store_app/providers/shoes_provider.dart';
import 'package:wear_store_app/widgets/shoe_item.dart';

class ShoesSummary extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoesCollections = ref.watch(shoesProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < 4; i++)
            Container(
              width: 180,
              height: 220,
              margin: const EdgeInsets.only(right: 16),
              child: ShoeItem(shoe: shoesCollections[i]),
            ),
        ],
      ),
    );
  }
}
