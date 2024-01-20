import 'package:flutter/material.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';

class HeroContainer extends StatelessWidget {
  const HeroContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadowMain(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: 185,
        decoration: BoxDecoration(
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
        child: Stack(
          children: [
            Positioned(
              right: -14,
              top: 8,
              child: Transform.rotate(
                angle: 32.1,
                child: Image.asset(
                  'assets/images/home.png',
                  width: 235,
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.7),
                  colorBlendMode: BlendMode.dstIn,
                ),
              ),
            ),
            Positioned(
              left: 24,
              bottom: 24,
              child: Text(
                "Explore,\nChoose,\nand Step Out in Confidence",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
