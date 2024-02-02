import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wear_store_app/providers/shoes_provider.dart';
import 'package:wear_store_app/providers/wishlist_provider.dart';
import 'package:wear_store_app/widgets/shoe_item.dart';

class CollectionsContainer extends ConsumerWidget {
  const CollectionsContainer(
    this.type, {
    super.key,
  });

  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var shoesCollection = ref.watch(shoesProvider);
    if (type == "wishlist") shoesCollection = ref.watch(wishlistProvider);

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
