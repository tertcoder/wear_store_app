import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wear_store_app/models/shoe.dart';

import 'package:wear_store_app/providers/shoes_provider.dart';
import 'package:wear_store_app/providers/wishlist_provider.dart';
import 'package:wear_store_app/widgets/shoe_item.dart';

class CollectionsContainer extends StatelessWidget {
  const CollectionsContainer(
    this.shoesCollection, {
    super.key,
  });

  final List<Shoe> shoesCollection;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      clipBehavior: Clip.antiAlias,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: shoesCollection.length,
      itemBuilder: (context, index) {
        return ShoeItem(shoe: shoesCollection[index]);
      },
    );
  }
}
