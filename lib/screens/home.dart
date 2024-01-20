import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';
import 'package:wear_store_app/widgets/user_avatar.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    const cartSvg = 'assets/icons/cart.svg';
    const hamburgerSvg = 'assets/icons/hamburger.svg';
    const searchSvg = 'assets/icons/search.svg';

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const Drawer(
        child: Text("Custom Drawer!"),
      ),
      appBar: AppBar(
        clipBehavior: Clip.none,
        backgroundColor: Theme.of(context).colorScheme.surface,
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
                    onTap: () => _scaffoldKey.currentState?.openDrawer(),
                    child: SvgPicture.asset(
                      hamburgerSvg,
                      semanticsLabel: 'Drawer',
                    ),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
          child: Column(
            children: [
              const UserAvatar(),
              const SizedBox(
                height: 32,
              ),
              ShadowMain(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: double.infinity,
                  height: 42,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.surface.withOpacity(0.7),
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {},
                    splashFactory: NoSplash.splashFactory,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          searchSvg,
                          semanticsLabel: 'Search',
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Search your pair...',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ShadowMain(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: double.infinity,
                  height: 185,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/home.webp'),
                      alignment: Alignment.centerRight,
                      // colorFilter: ColorFilter.mode(
                      //     Colors.transparent, BlendMode.darken,),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(0.9),
                        const Color(0xFFFB923C).withOpacity(0.5)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                      width: 1,
                    ),
                  ),
                  child: Stack(children: [
                    // Positioned(
                    //   right: 0,
                    //   bottom: 0,
                    //   child: Image.asset(
                    //     'assets/images/home.webp',
                    //     color: Color(0xFF8A5022),
                    //     colorBlendMode: BlendMode.darken,
                    //   ),
                    // ),
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
