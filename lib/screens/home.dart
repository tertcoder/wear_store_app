import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  Home({super.key});

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    const cartSvg = 'assets/icons/cart.svg';
    const hamburgerSvg = 'assets/icons/hamburger.svg';

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const Drawer(
        child: Text("Custom Drawer!"),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 36,
              height: 36,
              // margin: const EdgeInsets.only(left: 24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 1, color: Theme.of(context).colorScheme.outline),
              ),
              child: Center(
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () => scaffoldKey.currentState?.openDrawer(),
                  child: SvgPicture.asset(
                    hamburgerSvg,
                    semanticsLabel: 'Drawer',
                  ),
                ),
              ),
            ),
            Text(
              'Explore',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: 36,
              height: 36,
              // margin: const EdgeInsets.only(right: 24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 1, color: Theme.of(context).colorScheme.outline),
              ),
              child: InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {},
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -8,
                      right: -8,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.error,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          '9+',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onError,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        cartSvg,
                        semanticsLabel: 'Cart',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: const Text('Text'),
    );
  }
}
