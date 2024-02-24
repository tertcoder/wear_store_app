import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wear_store_app/models/shoe.dart';
import 'package:wear_store_app/providers/cart_provider.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';

class CartItem extends ConsumerWidget {
  const CartItem({super.key, required this.shoe});

  final Shoe shoe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartProvider);

    var color = Theme.of(context).colorScheme;
    var deleteIcon = Icon(
      Icons.delete,
      color: Theme.of(context).colorScheme.surface,
      size: 32,
    );

    return Dismissible(
      key: ValueKey(shoe),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: deleteIcon,
          ),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Align(
            alignment: Alignment.centerRight,
            child: deleteIcon,
          ),
        ),
      ),
      onDismissed: (direction) {
        ref.read(cartProvider.notifier).toogleInCart(shoe);
      },
      child: ShadowMain(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(
              BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                shoe.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          shoe.name,
                          style: TextStyle(
                            fontSize: 18,
                            color: color.onPrimaryContainer,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                "\$",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: color.onPrimaryContainer),
                              ),
                            ),
                            Text(
                              shoe.price.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: color.onPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "1 pair",
                          style: TextStyle(
                            fontSize: 12,
                            color: color.outline,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset('assets/icons/close.svg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
