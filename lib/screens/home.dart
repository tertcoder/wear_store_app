import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: Text(
          "Wear Store - Sneaker Platform",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
