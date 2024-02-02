import 'package:flutter/material.dart';

class NewShoe extends StatelessWidget {
  const NewShoe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const Center(child: Text("New Shoe")),
    );
  }
}
