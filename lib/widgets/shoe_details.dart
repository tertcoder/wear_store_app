import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wear_store_app/providers/cart_provider.dart';
import 'package:wear_store_app/providers/wishlist_provider.dart';
import 'package:wear_store_app/models/shoe.dart';
import 'package:wear_store_app/widgets/primary_button.dart';
import 'package:wear_store_app/widgets/shadow_inverse.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';

class ShoeDetails extends ConsumerWidget {
  const ShoeDetails(this.shoe, {super.key});

  final Shoe shoe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(wishlistProvider);
    ref.watch(cartProvider);

    const toWishlist = 'assets/icons/to_wishlist_icon.svg';
    const inWishlist = 'assets/icons/in_wishlist_icon.svg';
    const backIcon = 'assets/icons/arrow_backward.svg';
    const filledStarIcon = 'assets/icons/filled_star.svg';
    const outlinedStarIcon = 'assets/icons/outlined_star.svg';

    final isInWishlist = ref.read(wishlistProvider.notifier).isInWishlist(shoe);
    final isInCart = ref.read(cartProvider.notifier).isInCart(shoe);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Image.asset(
              shoe.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 50,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShadowMain(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1,
                          color: Theme.of(context).colorScheme.outline),
                    ),
                    child: Center(
                      child: InkWell(
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(
                          backIcon,
                          semanticsLabel: 'back',
                        ),
                      ),
                    ),
                  ),
                ),
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
                      forwardAnimationCurve: Curves.fastEaseInToSlowEaseOut, //
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.7),
                      barBlur: 4,
                      duration: const Duration(seconds: 2),
                    ).show(context);
                  },
                  child: SvgPicture.asset(
                    isInWishlist ? inWishlist : toWishlist,
                    width: 24,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ShadowInverse(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 450,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.name,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              "\$",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                          ),
                          Text(
                            "${shoe.price}",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(filledStarIcon),
                          SvgPicture.asset(filledStarIcon),
                          SvgPicture.asset(filledStarIcon),
                          SvgPicture.asset(outlinedStarIcon),
                        ],
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      ShadowMain(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          height: 156,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              "No description...",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      PrimaryButton(
                        label: isInCart ? "Remove from Cart" : "Add to Cart",
                        icon: SvgPicture.asset('assets/icons/cart.svg'),
                        handleClick: () {
                          final wasAdded = ref
                              .read(cartProvider.notifier)
                              .toogleInCart(shoe);

                          Flushbar(
                            messageText: Text(wasAdded
                                ? "Added to cart"
                                : "Removed from cart"),
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
                        fontSize: 24,
                        height: 68,
                        foregroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
