import 'package:flutter/material.dart';
import 'package:wear_store_app/widgets/cart_item.dart';
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
        children: const [
          SizedBox(height: 16),
          CartItem(),
        ],
      ),
    );
  }
}
