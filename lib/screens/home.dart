import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wear_store_app/providers/user_provider.dart';

import 'package:wear_store_app/widgets/brands_container.dart';
import 'package:wear_store_app/widgets/hero_container.dart';
import 'package:wear_store_app/widgets/main_app_bar.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';
import 'package:wear_store_app/widgets/shoes_summary.dart';
import 'package:wear_store_app/widgets/user_avatar.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const searchSvg = 'assets/icons/search.svg';
    print(ref.watch(userProvider));
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const Drawer(
        child: SafeArea(child: Text("Custom Drawer!")),
      ),
      appBar: MainAppBar(
        scaffoldKey: _scaffoldKey,
        title: "Explore",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    // onTap: () {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (context) => StoreScreen(
                    //         keyBoardFocus: true,
                    //       ),
                    //     ),
                    //   );
                    // },
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
              const HeroContainer(),
              const SizedBox(
                height: 46,
              ),
              const BrandsContainer(),
              const SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Our Collections",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: Size.zero,
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: Text(
                      "view all",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              ShoesSummary(),
            ],
          ),
        ),
      ),
    );
  }
}
