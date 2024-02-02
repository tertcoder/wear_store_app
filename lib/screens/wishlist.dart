import 'package:flutter/material.dart';
import 'package:wear_store_app/widgets/collections_container.dart';
import 'package:wear_store_app/widgets/main_app_bar.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MainAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Wishlist',
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 24),
        // padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: const CollectionsContainer("wishlist"),
      ),
    );
  }
}
