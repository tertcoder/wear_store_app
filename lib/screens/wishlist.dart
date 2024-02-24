import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wear_store_app/providers/wishlist_provider.dart';
import 'package:wear_store_app/widgets/collections_container.dart';
import 'package:wear_store_app/widgets/main_app_bar.dart';

class WishlistScreen extends ConsumerWidget {
  WishlistScreen({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoesCollection = ref.watch(wishlistProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MainAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Wishlist',
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 24),
        // padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: shoesCollection.isEmpty
            ? Center(
                child: Text(
                  "No Wished Items yet...",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontSize: 14,
                  ),
                ),
              )
            : CollectionsContainer(shoesCollection),
      ),
    );
  }
}
