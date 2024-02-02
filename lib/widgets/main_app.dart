import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:wear_store_app/screens/home.dart';
import 'package:wear_store_app/screens/store.dart';
import 'package:wear_store_app/screens/user_profile.dart';
import 'package:wear_store_app/screens/wishlist.dart';
import 'package:wear_store_app/widgets/new_shoe.dart';
import 'package:wear_store_app/widgets/shadow_inverse.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadowInverse(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: PersistentTabView(
        context,
        screens: [
          HomeScreen(),
          const StoreScreen(),
          const NewShoe(),
          WishlistScreen(),
          UserProfileScreen(),
        ],
        items: [
          PersistentBottomNavBarItem(
            icon: const HeroIcon(HeroIcons.home),
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary:
                Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          PersistentBottomNavBarItem(
            icon: const HeroIcon(HeroIcons.shoppingBag),
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary:
                Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          PersistentBottomNavBarItem(
              icon: HeroIcon(
                HeroIcons.plus,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              activeColorPrimary:
                  Theme.of(context).colorScheme.primaryContainer,
              inactiveColorPrimary:
                  Theme.of(context).colorScheme.primaryContainer,
              onPressed: (context) {
                pushNewScreen(context!, screen: NewShoe());
              }),
          PersistentBottomNavBarItem(
            icon: const HeroIcon(HeroIcons.heart),
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary:
                Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          PersistentBottomNavBarItem(
            icon: const HeroIcon(HeroIcons.user),
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary:
                Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ],
        navBarStyle: NavBarStyle.style15,
        decoration: NavBarDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
    );
  }
}
