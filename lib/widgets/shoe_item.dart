import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import 'package:wear_store_app/widgets/shadow_main.dart';

class ShoeItem extends StatelessWidget {
  const ShoeItem({super.key, required this.imageSrc, required this.shoeName});

  final String imageSrc;
  final String shoeName;

  @override
  Widget build(BuildContext context) {
    return ShadowMain(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageSrc),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, color: Theme.of(context).colorScheme.outline),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: GlassContainer(
                height: 60,
                width: double.infinity,
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.7),
                borderColor:
                    Theme.of(context).colorScheme.outline.withOpacity(0.5),
                blur: 10,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//                 clipBehavior: Clip.antiAliasWithSaveLayer,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(10),
//                     topLeft: Radius.circular(10),
//                   ),
//                   border: Border(
//                     top: BorderSide(
//                       color: Theme.of(context).colorScheme.outline,
//                       width: 1,
//                     ),
//                   ),
//                 ),
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(
//                     sigmaX: 10,
//                     sigmaY: 10,
//                   ),
//                   child: Container(
//                     height: 60,
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Theme.of(context)
//                           .colorScheme
//                           .primaryContainer
//                           .withOpacity(0.40),
//                     ),
//                     child: Text(shoeName),
//                   ),
//                 ),
//               ),
