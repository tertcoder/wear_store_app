import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wear_store_app/providers/cart_provider.dart';
import 'package:wear_store_app/widgets/cart_item.dart';
import 'package:wear_store_app/widgets/pushed_screen_app_bar.dart';

class Cart extends ConsumerWidget {
  Cart({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoesCollection = ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const PushedScreenAppBar(title: "My Cart"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 24),
        child: shoesCollection.isEmpty
            ? Center(
                child: Text(
                  "No Cart Items yet...",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontSize: 14,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: shoesCollection.length,
                itemBuilder: (ctx, idx) => CartItem(
                  shoe: shoesCollection[idx],
                ),
              ),
      ),
    );
  }
}
