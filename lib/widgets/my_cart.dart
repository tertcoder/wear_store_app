import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wear_store_app/providers/cart_provider.dart';
import 'package:wear_store_app/widgets/cart_item.dart';
import 'package:wear_store_app/widgets/pushed_screen_app_bar.dart';

class MyCart extends ConsumerWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const PushedScreenAppBar(
        title: "My Cart",
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                "No items in cart yet...",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontSize: 14,
                ),
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, idx) => CartItem(
                shoe: cartItems[idx],
              ),
            ),
      // body: ListView(
      //   children: const [
      //     SizedBox(height: 16),
      //     CartItem(),
      //   ],
      // ),
    );
  }
}
