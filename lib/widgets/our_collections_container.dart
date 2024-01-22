import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wear_store_app/providers/shoes_provider.dart';
import 'package:wear_store_app/widgets/shoe_item.dart';

class OurCollectionContainer extends ConsumerWidget {
  const OurCollectionContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableShoes = ref.watch(shoesProvider);
    final shoesCollection = ref.read(shoesProvider.notifier).shuffledShoe;

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return ShoeItem(
          imageSrc: shoesCollection[index].image,
          shoeName: shoesCollection[index].name,
        );
      },
    );
  }
}
