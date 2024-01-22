import 'package:flutter/material.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';

class ShoeItem extends StatelessWidget {
  const ShoeItem({super.key, required this.imageSrc, required this.shoeName});

  final String imageSrc;
  final String shoeName;

  @override
  Widget build(BuildContext context) {
    return ShadowMain(
      child: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imageSrc), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                child: Text(shoeName),
              ),
            ),
          ],
        ),
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
