import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:another_flushbar/flushbar.dart';

import 'package:wear_store_app/models/shoe.dart';
import 'package:wear_store_app/providers/wishlist_provider.dart';

import 'package:wear_store_app/widgets/shadow_main.dart';
import 'package:wear_store_app/widgets/shoe_details.dart';

class ShoeItem extends ConsumerWidget {
  const ShoeItem({super.key, required this.shoe});

  final Shoe shoe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(wishlistProvider);
    const toWishlist = 'assets/icons/to_wishlist_icon.svg';
    const inWishlist = 'assets/icons/in_wishlist_icon.svg';
    const toCart = 'assets/icons/to_cart_icon.svg';

    final isInWishlist = ref.read(wishlistProvider.notifier).isInWishlist(shoe);
    return ShadowMain(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ShoeDetails(shoe);
              },
            ),
          )
        },
        child: Container(
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
                      .withOpacity(0.5),
                  borderColor:
                      Theme.of(context).colorScheme.outline.withOpacity(0.1),
                  blur: 2,
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
                            InkWell(
                              onTap: () {
                                final wasAdded = ref
                                    .read(wishlistProvider.notifier)
                                    .toogleWishlist(shoe);

                                Flushbar(
                                  messageText: Text(wasAdded
                                      ? "Added to wishlist"
                                      : "Removed from wishlist"),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  flushbarStyle: FlushbarStyle.GROUNDED,
                                  forwardAnimationCurve:
                                      Curves.fastEaseInToSlowEaseOut,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                      .withOpacity(0.7),
                                  barBlur: 4,
                                  duration: const Duration(seconds: 2),
                                ).show(context);
                              },
                              child: SvgPicture.asset(
                                  isInWishlist ? inWishlist : toWishlist),
                            ),
                            SvgPicture.asset(toCart),
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
