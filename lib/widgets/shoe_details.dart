import 'package:flutter/material.dart';

class ShoeDetails extends StatelessWidget {
  const ShoeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const Center(child: Text("Shoe Details")),
    );
  }
}
