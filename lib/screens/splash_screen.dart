import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/icons/logo.svg",
              // width: 64,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 12,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFB923C),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(width: 12),
                const Text("Finding the perfect pair for you..."),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
