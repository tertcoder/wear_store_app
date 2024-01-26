import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:wear_store_app/screens/home.dart';
import 'package:wear_store_app/screens/store.dart';
import 'package:wear_store_app/screens/user_profile.dart';
import 'package:wear_store_app/screens/wishlist.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: [
        HomeScreen(),
        StoreScreen(),
        StoreScreen(),
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
          activeColorPrimary: Theme.of(context).colorScheme.primaryContainer,
          inactiveColorPrimary: Theme.of(context).colorScheme.primaryContainer,
        ),
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
    );
  }
}
