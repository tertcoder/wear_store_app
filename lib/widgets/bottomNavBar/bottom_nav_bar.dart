import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wear_store_app/providers/active_screen_provider.dart';
import 'package:wear_store_app/screens/home.dart';
import 'package:wear_store_app/screens/store.dart';
import 'package:wear_store_app/screens/user_profile.dart';
import 'package:wear_store_app/screens/wishlist.dart';
import 'package:wear_store_app/widgets/new_shoe.dart';
import 'package:wear_store_app/widgets/shadow_inverse.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  BorderRadius bottomNavRadius = const BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
  );
  @override
  Widget build(BuildContext context) {
    final kColor = Theme.of(context).colorScheme;
    final int activeScreenIndex = ref.watch(activeScreenProvider);
    List<Widget> screens = [
      HomeScreen(),
      const StoreScreen(),
      WishlistScreen(),
      UserProfileScreen(),
    ];
    return Scaffold(
      body: screens[activeScreenIndex],
      bottomNavigationBar: ShadowInverse(
        borderRadius: bottomNavRadius,
        child: Container(
          decoration: BoxDecoration(
            color: kColor.surface,
            border: Border(
              top: BorderSide(color: kColor.outline),
              left: BorderSide(color: kColor.outline),
              right: BorderSide(color: kColor.outline),
            ),
            borderRadius: bottomNavRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  ref.read(activeScreenProvider.notifier).state = 0;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  // child: HeroIcon(HeroIcons.home),
                  child: activeScreenIndex == 0
                      ? SvgPicture.asset(
                          'assets/icons/home.svg',
                          colorFilter: ColorFilter.mode(
                            kColor.primary,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/icons/home.svg',
                        ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(activeScreenProvider.notifier).state = 1;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: activeScreenIndex == 1
                      ? SvgPicture.asset(
                          'assets/icons/store.svg',
                          colorFilter: ColorFilter.mode(
                            kColor.primary,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/icons/store.svg',
                        ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -30),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      useSafeArea: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return const NewShoe();
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: kColor.secondaryContainer,
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: kColor.outline,
                        ),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/add.svg',
                      // colorFilter: const ColorFilter.mode(
                      //   Colors.red,
                      //   BlendMode.srcIn,
                      // ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(activeScreenProvider.notifier).state = 2;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: activeScreenIndex == 2
                      ? SvgPicture.asset(
                          'assets/icons/heart.svg',
                          colorFilter: ColorFilter.mode(
                            kColor.primary,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/icons/heart.svg',
                        ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(activeScreenProvider.notifier).state = 3;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: activeScreenIndex == 3
                      ? SvgPicture.asset(
                          'assets/icons/user.svg',
                          colorFilter: ColorFilter.mode(
                            kColor.primary,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/icons/user.svg',
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
