import 'package:flutter/material.dart';
import 'package:wear_store_app/widgets/brand.dart';

class BrandsContainer extends StatelessWidget {
  const BrandsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Brands",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Brand('Nike'),
              SizedBox(width: 12),
              Brand('Adidas'),
              SizedBox(width: 12),
              Brand('Reebok'),
              SizedBox(width: 12),
              Brand('Vans'),
              SizedBox(width: 12),
              Brand('Other'),
            ],
          ),
        )
      ],
    );
  }
}
