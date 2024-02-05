import 'package:flutter/material.dart';
import 'package:wear_store_app/widgets/pushed_screen_app_bar.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const PushedScreenAppBar(
        title: "My Cart",
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          ShadowMain(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/shoes/image-7.webp",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
