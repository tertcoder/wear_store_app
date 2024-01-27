import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:wear_store_app/models/shoe.dart';

import 'package:wear_store_app/widgets/shadow_main.dart';

class ShoeItem extends StatelessWidget {
  const ShoeItem({super.key, required this.shoe});

  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    const toWishlist = 'assets/icons/to_wishlist_icon.svg';
    const toCart = 'assets/icons/to_cart_icon.svg';
    return ShadowMain(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(shoe.image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: GlassContainer(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 12,
                ),
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.7),
                borderColor:
                    Theme.of(context).colorScheme.outline.withOpacity(0.5),
                blur: 10,
                borderRadius: BorderRadius.circular(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            shoe.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '\$${shoe.price}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(toWishlist),
                          SvgPicture.asset(toCart),
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
