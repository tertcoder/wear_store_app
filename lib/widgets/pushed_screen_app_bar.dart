import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';

class PushedScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PushedScreenAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    const String backIcon = 'assets/icons/arrow_backward.svg';
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:
            Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.25),
      ),
      centerTitle: true,
      scrolledUnderElevation: 0,
      clipBehavior: Clip.none,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ShadowMain(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.only(left: 24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.outline),
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
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
