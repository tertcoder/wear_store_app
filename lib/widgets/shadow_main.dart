import 'package:flutter/material.dart';

class ShadowMain extends StatelessWidget {
  const ShadowMain(
      {super.key, required this.child, required this.borderRadius});

  final Widget child;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.25),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 18,
          ),
        ],
      ),
      child: child,
    );
  }
}
