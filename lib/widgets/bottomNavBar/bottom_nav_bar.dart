import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:wear_store_app/screens/home.dart';
import 'package:wear_store_app/widgets/shadow_inverse.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  BorderRadius bottomNavRadius = const BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
  );
  @override
  Widget build(BuildContext context) {
    var kColor = Theme.of(context).colorScheme;
    var activeScreen = HomeScreen();
    return Scaffold(
      body: activeScreen,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  // child: HeroIcon(HeroIcons.home),
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    color: Colors.red,
                  ),
                ),
              ),
              GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: HeroIcon(HeroIcons.shoppingBag),
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: kColor.secondaryContainer,
                  ),
                  child: HeroIcon(
                    HeroIcons.plus,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: HeroIcon(HeroIcons.heart),
                ),
              ),
              GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: HeroIcon(HeroIcons.user),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
