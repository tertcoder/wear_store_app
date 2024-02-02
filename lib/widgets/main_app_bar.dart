import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.scaffoldKey, required this.title});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    const cartSvg = 'assets/icons/cart.svg';
    const hamburgerSvg = 'assets/icons/hamburger.svg';

    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:
            Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.25),
      ),
      scrolledUnderElevation: 0,
      clipBehavior: Clip.none,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShadowMain(
            borderRadius: BorderRadius.circular(10),
            child: Container(
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
          ),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          ShadowMain(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 36,
              height: 36,
              // margin: const EdgeInsets.only(right: 24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).colorScheme.outline,
                ),
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
          ),
        ],
      ),
    );
  }
}
