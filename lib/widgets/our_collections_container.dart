import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wear_store_app/providers/shoes_provider.dart';
import 'package:wear_store_app/widgets/shoe_item.dart';

class OurCollectionContainer extends ConsumerWidget {
  const OurCollectionContainer({
    super.key,
    required this.shrinkWrap,
    this.itemLength,
    this.shuffle = false,
  });

  final int? itemLength;
  final bool shrinkWrap;
  final bool shuffle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoesCollection = shuffle
        ? ref.read(shoesProvider.notifier).shuffledShoe
        : ref.read(shoesProvider);

    return GridView.builder(
      clipBehavior: Clip.antiAlias,
      shrinkWrap: shrinkWrap,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: itemLength ?? shoesCollection.length,
      itemBuilder: (context, index) {
        return ShoeItem(shoe: shoesCollection[index]);
      },
    );
  }
}
